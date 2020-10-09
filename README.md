# flutter_app1

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


项目结构:

  lib: 项目内容
    01_counter: 简单计算器，入门案例
    02_route: 路由案例
  flutter_app1.iml: 项目路径配置
  pubspec.yaml: 包管理依赖
  question.yaml: 问题参见



安装 java 环境 java jdk
配置Android 环境变量

安装android studio
  下载 android sdk
  下载 dart & flutter 插件

安装flutter-sdk



## 运行实例
    flutter run ./lib/01_counter/app.dart




> 打包:
## 首先创建 key.jks
keytool -genkey -v -keystore path/key.jks -keyalg RSA -keysize 2048 -validity
## 创建 key.properties
<app dir>/android/key.properties

    storePassword= # 创建 key.jks 时，输入的密码
    keyPassword= # 同上
    keyAlias=key # 昵称
    storeFile=C:\Users\asus\key.jks # 生成的 key.jks 的路径

## 在gradle中配置签名
<app dir>/android/app/build.gradle

## 读取签名
在 android{ …… } 配置之前，加入读取 key.properties 的代码
    def keystorePropertiesFile = rootProject.file("key.properties")
    def keystoreProperties = new Properties()
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

    android {

## 配置签名

将

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig signingConfigs.debug
        }
    }

替换为

    signingConfigs {
        release {
        # 设置签名信息
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile file(keystoreProperties['storeFile'])
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release # 使用 release 配置
        }
    }


## 进入工程根目录
运行flutter build apk (flutter build 默认会包含 --release选项).

打包好的发布APK位于<app dir>/build/app/outputs/apk/app-release.apk。



























