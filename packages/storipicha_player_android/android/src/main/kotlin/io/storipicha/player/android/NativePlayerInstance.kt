package io.storipicha.player.android

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.view.Surface
import android.view.SurfaceView
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import io.flutter.plugin.common.EventChannel
import io.flutter.view.TextureRegistry.SurfaceTextureEntry

class NativePlayerInstance(
    context: Context,
    private val surfaceEntry: SurfaceTextureEntry
) {
    var exoPlayer: ExoPlayer? = ExoPlayer.Builder(context).build()
    var surface: Surface? = Surface(surfaceEntry.surfaceTexture())
    
    private var eventSink: EventChannel.EventSink? = null
    private val handler = Handler(Looper.getMainLooper())
    private var positionRunnable: Runnable? = null

    init {
        surface?.let { exoPlayer?.setVideoSurface(it) }

        // 🎧 Listen to native ExoPlayer state & timeline changes
        exoPlayer?.addListener(object : Player.Listener {
            override fun onIsPlayingChanged(isPlaying: Boolean) {
                sendStateUpdate()
                if (isPlaying) {
                    startPositionUpdates()
                } else {
                    stopPositionUpdates()
                }
            }

            override fun onPlaybackStateChanged(playbackState: Int) {
                sendStateUpdate()
            }

            // ⏱️ Fired when media duration/metadata becomes available
            override fun onTimelineChanged(timeline: androidx.media3.common.Timeline, reason: Int) {
                sendStateUpdate()
            }

            // ⏩ Fired when user seeks or position jumps
            override fun onPositionDiscontinuity(
                oldPosition: Player.PositionInfo,
                newPosition: Player.PositionInfo,
                reason: Int
            ) {
                sendStateUpdate()
            }
        })
    }

    fun setEventSink(sink: EventChannel.EventSink?) {
        this.eventSink = sink
        sendStateUpdate()
    }

    private fun sendStateUpdate() {
        val player = exoPlayer ?: return
        val sink = eventSink ?: return

        // 1️⃣ Map ExoPlayer states to Dart's PlaybackState enum strings
        val stateString = when (player.playbackState) {
            Player.STATE_IDLE -> "idle"
            Player.STATE_BUFFERING -> "buffering"
            Player.STATE_READY -> "ready"
            Player.STATE_ENDED -> "ended"
            else -> "idle"
        }

        // 2️⃣ Sanitize duration: Ignore C.TIME_UNSET (-9223372036854775807)
        val rawDuration = player.duration
        val safeDuration = if (rawDuration != C.TIME_UNSET && rawDuration > 0) rawDuration else 0L

        // 3️⃣ Build state map with Long values matching Dart's expected keys
        val stateMap = mapOf(
            "state" to stateString,
            "isPlaying" to player.isPlaying,
            "position" to player.currentPosition.coerceAtLeast(0L),
            "bufferedPosition" to player.bufferedPosition.coerceAtLeast(0L),
            "duration" to safeDuration,
            "errorMessage" to player.playerError?.message
        )

        handler.post { sink.success(stateMap) }
    }

    private fun startPositionUpdates() {
        stopPositionUpdates()
        positionRunnable = object : Runnable {
            override fun run() {
                if (exoPlayer?.isPlaying == true) {
                    sendStateUpdate()
                    handler.postDelayed(this, 200) // Update 5 times per second for smooth slider movement ⏱️
                }
            }
        }
        handler.post(positionRunnable!!)
    }

    private fun stopPositionUpdates() {
        positionRunnable?.let { handler.removeCallbacks(it) }
        positionRunnable = null
    }

    fun attachToSurfaceView(surfaceView: SurfaceView) {
        exoPlayer?.setVideoSurfaceView(surfaceView)
    }

    fun setMediaItem(url: String) {
        val mediaItem = MediaItem.fromUri(url)
        exoPlayer?.setMediaItem(mediaItem)
        exoPlayer?.prepare()
    }

    fun play() {
        exoPlayer?.play()
    }

    fun pause() {
        exoPlayer?.pause()
    }

    fun seekTo(positionMs: Long) {
        exoPlayer?.seekTo(positionMs)
        sendStateUpdate()
    }

    fun dispose() {
        stopPositionUpdates()
        exoPlayer?.stop()
        exoPlayer?.release()
        exoPlayer = null
        
        surface?.release()
        surface = null
        
        surfaceEntry.release()
        eventSink = null
    }
}