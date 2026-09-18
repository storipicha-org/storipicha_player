package io.storipicha.player.android

import android.content.Context
import android.view.SurfaceView
import android.view.View
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class StoripichaSurfaceViewFactory(
    private val players: Map<Long, NativePlayerInstance>
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as? Map<String, Any>
        val textureId = (creationParams?.get("textureId") as? Number)?.toLong()
        val playerInstance = players[textureId]

        return object : PlatformView {
            private val surfaceView = SurfaceView(context).apply {
                playerInstance?.attachToSurfaceView(this)
            }

            override fun getView(): View = surfaceView
            override fun dispose() {}
        }
    }
}