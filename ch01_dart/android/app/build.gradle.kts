import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.ch01_dart"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.ch01_dart"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            // ⚠️ 수정: 'rootProject.extra["..."]'를 통해 최상위 프로젝트 변수에 접근
            val keystoreProps = rootProject.extra["keystoreProperties"] as Properties

            keyAlias = keystoreProps.getProperty("keyAlias")
            keyPassword = keystoreProps.getProperty("keyPassword")

            val storeFilePath = keystoreProps.getProperty("storeFile")
            storeFile = if (storeFilePath != null) rootProject.file(storeFilePath) else null
            storePassword = keystoreProps.getProperty("storePassword")
        }
    }

    buildTypes {
        release {
            // 수정! 디버그 키 대신 위에서 정의한 릴리즈 서명 설정을 사용하도록 변경
            signingConfig = signingConfigs.getByName("release") 
            
            // 릴리즈 최적화 설정 추가 (선택 사항)
            isMinifyEnabled = true
            isShrinkResources = true
        }
    }
}

flutter {
    source = "../.."
}
