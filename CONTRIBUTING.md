# 🤝 Contributing to StoriPicha Player

Thank you for your interest in contributing to **StoriPicha Player** (`storipicha_player`)! 🚀

This document provides guidelines and workflows for contributing to our federated Flutter video player plugin.

---

## 🏛️ Project Structure

The project uses a **Federated Plugin Architecture** split across distinct packages:

* **`storipicha_player`**: The main user-facing Dart package.
* **`storipicha_player_platform_interface`**: Common platform interfaces, method signatures, and data contracts.
* **`storipicha_player_android`**: Native Android implementation using **AndroidX Media3 (ExoPlayer)**.
* **`storipicha_player_ios`**: Native iOS implementation using **AVFoundation (AVPlayer)** and `FlutterTexture`.
* **`example`**: Demonstration app for testing across platforms.

---

## 🛠️ Local Development Setup

### Prerequisites

* **Flutter SDK**: Ensure you have the latest stable Flutter SDK installed.
* **Android**: Android Studio with NDK & API Level 21+ support.
* **iOS**: macOS with Xcode 15+ installed.

### Bootstrap Workspace

We use [Melos](https://melos.invertase.dev/) to manage multi-package repository dependencies.

```bash
# 1. Install Melos globally
dart pub global activate melos

# 2. Bootstrap all federated packages & link dependencies
melos bootstrap
