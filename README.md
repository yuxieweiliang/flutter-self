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






打包:
# 首先创建 key.jks
keytool -genkey -v -keystore path/key.jks -keyalg RSA -keysize 2048 -validity
# 创建 key.properties
<app dir>/android/key.properties

- - - - - - - - - - - - - - - - - - - - -
storePassword= # 创建 key.jks 时，输入的密码
keyPassword= # 同上
keyAlias=key # 昵称
storeFile=C:\Users\asus\key.jks # 生成的 key.jks 的路径
- - - - - - - - - - - - - - - - - - - - -

# 在gradle中配置签名
<app dir>/android/app/build.gradle

# 读取签名
- - - - - - - - - - - - - - - - - - - - -
`
# 在 android{ …… } 配置之前，加入读取 key.properties 的代码
def keystorePropertiesFile = rootProject.file("key.properties")
def keystoreProperties = new Properties()
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

android {

`

# 配置签名

`
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
`

# 进入工程根目录
运行flutter build apk (flutter build 默认会包含 --release选项).

打包好的发布APK位于<app dir>/build/app/outputs/apk/app-release.apk。










人物设定:

各种自定义设定: # 比如：武器（排行、等级、名称、材质、技能）、功法（等级、内容、属性）、宠物（名称、能力、战力、属性、种族、）、灵花异草、异兽灵宠、丹药魔法、功法秘术
  包括设定的种类，以及设定中的各种属性，都可以自定义

排行: # 排行分为两种，一种是传说武器的排行，这种是万古不变的，一种是每年都会改变的，比如战力的排行。

出场时间轴: # 有了出场时间轴，基本上是有了故事的大纲，甚至可以从中间开始写，不一定是流水账。

人物关系图:

人物周边: # 这个周边可以是小故事，也可以是一些记录后续的情节，或者是人物某些特定的情节的隐藏部分。

组织阵营:

地理位置/风土人情:

时代背景:

人物肖像:

大纲:

分卷:

片段: # 比如我突然想到了一个好的片段，可以在后面使用，但是现在还未写到，就可以先记录下来，这个片段可以记录在时间轴特定的位置。


武器库: # 这是一个武器的仓库，大家可以自己来添加，后台复审，是整个网站所属。

武器排行: # 武器库中添加的武器，大家可以根据能力开设定排行。

同样灵兽、妖兽、奇花异草、异火、冰晶、奇珍异宝，都可以设定。 # 并且这种设定是可以附带图片，以及简介的。

资源共享库: # 这里可以有很多科普性的知识。 比如动物大全、昆虫大全、枪支、官僚等级、武功心法、人体结构、穴位



















