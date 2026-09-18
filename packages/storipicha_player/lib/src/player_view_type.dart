/// Defines the rendering view strategy for the player.
enum PlayerViewType {
  /// 🎨 Renders via Flutter's GPU `Texture` widget.
  /// Best for smooth animations, transforms, and UI overlays.
  texture,

  /// 📱 Renders via a native platform view (`AndroidView` on Android / `UiKitView` on iOS).
  /// Best for DRM content, high frame rates, and power efficiency.
  surface,
}
