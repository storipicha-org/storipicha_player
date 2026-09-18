pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        val propertiesFile = File(settingsDir, "local.properties")
        if (propertiesFile.exists()) {
            propertiesFile.inputStream().use { properties.load(it) }
        }
        properties.getProperty("flutter.sdk") ?: System.getenv("FLUTTER_ROOT")
        ?: throw GradleException("Flutter SDK not found. Define flutter.sdk in local.properties or FLUTTER_ROOT env variable.")
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
    plugins {
        id("com.android.library") version "8.7.3" apply false
        id("org.jetbrains.kotlin.android") version "2.0.20" apply false
        id("dev.flutter.flutter-plugin-loader") version "1.0.0" // 👈 Stays strictly here
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}

plugins {
    id("org.gradle.toolchains.foojay-resolver-convention") version "1.0.0"
}

rootProject.name = "storipicha_player_android"
