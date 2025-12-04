// 필요한 클래스 import
import java.util.Properties
import java.io.FileInputStream

// 키스토어 정보를 읽어 'ext' 속성으로 프로젝트 전역에 공유
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystorePropertiesFile.inputStream().use {
        keystoreProperties.load(it)
    }
}
// 이 코드를 통해 keystoreProperties 객체를 프로젝트의 'ext' 속성으로 저장하여 
// 모든 서브 모듈(app/build.gradle.kts)에서 접근 가능하게 만듭니다.
rootProject.extra.set("keystoreProperties", keystoreProperties)

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
