plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    // id("com.google.gms.google-services")
    // // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.new_project"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"  // ← أضف أو غيّر السطر ده (أهم حاجة)

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.new_project"  // غيّره لـ com.youssif.foodcheck أو اسم التطبيق بتاعك لو عايز
        minSdk = 23                               // ← غيّر من flutter.minSdkVersion لـ 23 (أو 24 لو عايز أحدث)
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}