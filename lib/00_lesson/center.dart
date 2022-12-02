import 'package:flutter/material.dart';

void main() {

  // 方法一：container.alignment 属性
  runApp(
    Container(
      width: 400.0,
      height: 400.0,
      alignment: Alignment.center,
      child: Text('居中'),
    ),
  );

  // 方法二：Center 包裹内容
  runApp(
    Container(
      width: 400.0,
      height: 400.0,
      child: Center(
        child: Text('居中'),
      ),
    ),
  );
}



