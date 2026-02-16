plugins {
    id("com.android.application")
    id("kotlin-android")
    // Flutter Gradle Plugin (must be last)
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.bankmate_app"

    // ✅ REQUIRED by sqflite_android
    compileSdk = 36

    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.bankmate_app"

        // ✅ Stable minimum for Flutter + SQLite
        minSdk = flutter.minSdkVersion

        // ✅ Match compileSdk
        targetSdk = 36

        // ✅ App versioning (correct place)
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            // Debug signing for development
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
