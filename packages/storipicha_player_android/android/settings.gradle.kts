pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
    plugins {
        // 🎯 Declare AGP and Kotlin plugin versions for all subprojects
        id("com.android.library") version "8.2.2" apply false
        id("org.jetbrains.kotlin.android") version "1.9.22" apply false
    }
}

rootProject.name = "storipicha_player_android"