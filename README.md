# 🎬 storipicha_player

A high-performance, cross-platform video and audio playback package built for the **Storipicha** ecosystem. Designed to replace legacy player wrappers by providing low-level native engine integrations, strict memory control, and seamless background execution.

---

## 🏗️ Architecture Overview

`storipicha_player` uses a **Federated Plugin Architecture** managed by [Melos](https://melos.invertase.dev/). This isolates platform-specific code, making native maintenance direct and preventing memory leaks across playback lifecycles.

```text
storipicha_player/                      <-- Root (Melos Workspace)
├── packages/
│   ├── storipicha_player_platform_interface/ # Abstract API & Event Channel Contracts
│   ├── storipicha_player_android/            # Kotlin + AndroidX Media3 (ExoPlayer)
│   ├── storipicha_player_ios/                # Swift + AVFoundation (AVPlayer)
│   └── storipicha_player/                    # Public User-Facing Controller API
└── example/                                  # Unified Test App
