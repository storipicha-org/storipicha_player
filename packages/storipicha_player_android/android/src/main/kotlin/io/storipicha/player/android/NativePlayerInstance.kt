package io.storipicha.player.android

import android.content.Context
import android.view.Surface
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import io.flutter.view.TextureRegistry.SurfaceTextureEntry

/** 🤖 Wraps a single Media3 ExoPlayer instance bound to a Flutter SurfaceTexture. */
class NativePlayerInstance(
    context: Context,
    private val surfaceEntry: SurfaceTextureEntry
) {
    private val exoPlayer: ExoPlayer = ExoPlayer.Builder(context).build()
    private val surface: Surface = Surface(surfaceEntry.surfaceTexture())

    init {
        // 🎨 Attach the GPU surface to the ExoPlayer instance
        exoPlayer.setVideoSurface(surface)
    }

    /** 🚀 Sets a media URL and prepares the player for playback. */
    fun prepare(url: String) {
        val mediaItem = MediaItem.fromUri(url)
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
    }

    /** ▶️ Starts or resumes video playback. */
    fun play() {
        exoPlayer.play()
    }

    /** ⏸️ Pauses video playback. */
    fun pause() {
        exoPlayer.pause()
    }

    /** 🧹 Cleans up native resources when the player widget is disposed. */
    fun dispose() {
        exoPlayer.stop()
        exoPlayer.release()
        surface.release()
        surfaceEntry.release()
    }
}