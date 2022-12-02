import 'package:flutter/material.dart';
/// https://cloud.tencent.com/developer/ask/126961
/// https://flutterchina.club/widgets-intro/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      //容器外补白
      margin: EdgeInsets.only(top: 5.0, left: 10),
      //卡片大小
      constraints: BoxConstraints.tightFor(width: 100.0, height: 100.0),
      //背景装饰
      decoration: BoxDecoration(
        //背景径向渐变
          gradient: RadialGradient(
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: .98
          ),
          //卡片阴影
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0
            )
          ]
      ),
      //卡片倾斜变换
      transform: Matrix4.rotationZ(.2),
      //卡片内文字居中
      alignment: Alignment.center,
      child: new Container(
        constraints: BoxConstraints.tightFor(width: 500.0, height: 500.0),
        margin: EdgeInsets.all(20.0),
        color: Colors.orange,
        child: new Text("Hello world!", textDirection: TextDirection.ltr,),
      ),
    );
  }
}



