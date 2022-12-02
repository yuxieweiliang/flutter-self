import 'package:flutter/material.dart';
/// https://flutterchina.club/widgets-intro/
/// 一个最简单 Flutter 程序
/// 1. 框架强制根widget覆盖整个屏幕
/// 2. 文本显示的方向需要在Text实例中指定 * Flutter 默认不指定文本方向。当使用MaterialApp时，文本的方向将自动设定。
void main() {
  runApp(
    new Center(
      child: new Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}



