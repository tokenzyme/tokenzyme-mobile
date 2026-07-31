allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
// Some third-party Flutter plugins still declare an old compileSdk — coinbase_wallet_sdk
// and appcheck, both pulled in by reown_appkit, compile against android-31. From AGP 8.8
// that is a hard error, because their own AndroidX dependencies require 34+.
//
// Registering afterEvaluate here, BEFORE the evaluationDependsOn block below, is what
// makes this work: the callback runs at the end of each plugin's own evaluation, after
// its build.gradle has set compileSdk and before AGP reads it. Declared after that
// block, the projects are already evaluated and Gradle rejects the callback outright.
subprojects {
    afterEvaluate {
        extensions.findByType(com.android.build.gradle.LibraryExtension::class.java)?.let {
            if ((it.compileSdk ?: 0) < 36) {
                it.compileSdk = 36
            }
        }
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
