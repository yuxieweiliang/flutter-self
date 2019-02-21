
# 使用本地图片
new Image(
    image: AssetImage("images/avatar.jpg"),
    width: 80.0
)
一、
创建文件：
assets/fonts/Kaiju.ttf

二、
pubspec.yaml
flutter:
  assets:
    - images/avatar.jpg


# 使用网络图片
new Image(
  image: NetworkImage(
      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
),
new Image.network(
  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
),

######################################## 使用 ICON #################################################
# Flutter默认包含了一套Material Design的字体图标，在pubspec.yaml文件中的配置如下
flutter:
  uses-material-design: true

String icons = "";
// accessible: &#xE914; or 0xE914 or E914
icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
icons += " \uE90D";

Text(icons,
  style: TextStyle(
      fontFamily: "MaterialIcons",
      fontSize: 24.0,
      color: Colors.green
  ),
);