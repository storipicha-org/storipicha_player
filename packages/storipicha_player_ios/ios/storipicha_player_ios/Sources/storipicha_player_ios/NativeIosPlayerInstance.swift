import AVFoundation
import Flutter
import UIKit

/// 🍎 Native iOS player instance backed by AVPlayer and FlutterTexture.
class NativeIosPlayerInstance: NSObject, FlutterTexture, FlutterStreamHandler {
    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?
    private var videoOutput: AVPlayerItemVideoOutput?

    private let textureRegistry: FlutterTextureRegistry
    private let textureId: Int64

    private var eventSink: FlutterEventSink?
    private var timeObserverToken: Any?

    // KVO context pointers
    private var statusObserver: NSKeyValueObservation?
    private var timeControlObserver: NSKeyValueObservation?

    init(textureRegistry: FlutterTextureRegistry, textureId: Int64) {
        self.textureRegistry = textureRegistry
        self.textureId = textureId
        self.player = AVPlayer()
        super.init()

        setupObservers()
    }

    // MARK: - FlutterTexture

    /// Called by Flutter's render engine whenever a new frame is needed.
    func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        guard let videoOutput = videoOutput,
            let playerItem = playerItem
        else { return nil }

        let currentTime = playerItem.currentTime()
        if videoOutput.hasNewPixelBuffer(forItemTime: currentTime),
            let pixelBuffer = videoOutput.copyPixelBuffer(
                forItemTime: currentTime, itemTimeForDisplay: nil)
        {
            return Unmanaged.passRetained(pixelBuffer)
        }
        return nil
    }

    // MARK: - Playback Control Methods

    func setMediaItem(url: String) {
        guard let streamUrl = URL(string: url) else { return }

        // 1. Create asset and item
        let asset = AVURLAsset(url: streamUrl)
        playerItem = AVPlayerItem(asset: asset)

        // 2. Configure video output for FlutterTexture rendering
        let pixelBufferAttributes: [String: Any] = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA
        ]
        videoOutput = AVPlayerItemVideoOutput(pixelBufferAttributes: pixelBufferAttributes)
        playerItem?.add(videoOutput!)

        // 3. Attach item to player
        player?.replaceCurrentItem(with: playerItem)

        // 4. Observe item status changes (readyToPlay, failed, etc.)
        statusObserver = playerItem?.observe(\.status, options: [.new, .old]) {
            [weak self] item, _ in
            self?.sendStateUpdate()
        }
    }

    func play() {
        player?.play()
    }

    func pause() {
        player?.pause()
    }

    func seekTo(positionMs: Int64) {
        let time = CMTime(value: positionMs, timescale: 1000)
        player?.seek(to: time, toleranceBefore: .zero, toleranceAfter: .zero) { [weak self] _ in
            self?.sendStateUpdate()
        }
    }

    // MARK: - EventChannel & KVO Observers

    private func setupObservers() {
        // Observe playing/paused state
        timeControlObserver = player?.observe(\.timeControlStatus, options: [.new]) {
            [weak self] _, _ in
            self?.sendStateUpdate()
        }

        // Periodic time observer for continuous progress ticks ⏱️
        let interval = CMTime(value: 1, timescale: 2)  // Every 500ms
        timeObserverToken = player?.addPeriodicTimeObserver(forInterval: interval, queue: .main) {
            [weak self] _ in
            self?.textureRegistry.textureFrameAvailable(self?.textureId ?? 0)
            self?.sendStateUpdate()
        }
    }

    // MARK: - FlutterStreamHandler Protocol Methods

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink)
        -> FlutterError?
    {
        self.eventSink = events
        sendStateUpdate()
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }

    private func sendStateUpdate() {
        guard let sink = eventSink else { return }

        let isPlaying = player?.timeControlStatus == .playing
        let isBuffering = playerItem?.isPlaybackLikelyToKeepUp == false && isPlaying

        // Map AVPlayerStatus to Dart PlaybackState enum strings
        var stateString = "idle"
        if let item = playerItem {
            switch item.status {
            case .readyToPlay:
                stateString = isBuffering ? "buffering" : "ready"
            case .failed:
                stateString = "error"
            case .unknown:
                stateString = "idle"
            @unknown default:
                stateString = "idle"
            }
        }

        // 🛡️ 1. Safely calculate position (prevents Double.nan / infinity crash)
        let rawPos = player?.currentTime().seconds ?? 0
        let currentPosMs: Int64 = (rawPos.isFinite && !rawPos.isNaN) ? Int64(rawPos * 1000) : 0

        // 🛡️ 2. Safely calculate duration (prevents Double.nan / infinity crash)
        let rawDuration = playerItem?.duration.seconds ?? 0
        let safeDurationMs: Int64 =
            (rawDuration.isFinite && !rawDuration.isNaN && rawDuration > 0)
            ? Int64(rawDuration * 1000) : 0

        let stateMap: [String: Any?] = [
            "state": stateString,
            "isPlaying": isPlaying,
            "position": max(0, currentPosMs),
            "bufferedPosition": 0,
            "duration": safeDurationMs,
            "errorMessage": playerItem?.error?.localizedDescription,
        ]

        sink(stateMap)
    }

    func dispose() {
        if let token = timeObserverToken {
            player?.removeTimeObserver(token)
            timeObserverToken = nil
        }
        statusObserver?.invalidate()
        timeControlObserver?.invalidate()

        player?.pause()
        player = nil
        playerItem = nil
        videoOutput = nil
        eventSink = nil
    }
}
