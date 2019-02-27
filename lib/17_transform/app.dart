import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ParentPage(title: 'Row 对齐方式'),
    );
  }
}

class ParentPage extends StatefulWidget {
  ParentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ParentPageState createState() => new _ParentPageState();
}

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

Widget blueBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.blue),
);

class _ParentPageState extends State<ParentPage> {
  @override
  Widget build(BuildContext context) {

    // 页面脚手架
    return Scaffold(
        appBar: AppBar( title: Text(widget.title),),

        /// ConstrainedBox -> BoxConstraints
        body: Column(
          children: <Widget>[

            /// Transform变换
            Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Container(
                  color: Colors.black54,
                  child: new Transform(
                    alignment: Alignment.topRight,
                    transform: new Matrix4.skewY(.3),
                    child: new Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.deepOrange,
                      child: const Text('Apartment for rent'),
                    ),
                  ),
                ),
            ),

            /// 平移
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.translate(
                    offset: Offset(-20, -5),
                    child: Text('hello world'),
                  ),
                )
            ),

            /// 旋转
            Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.rotate(
                    angle: math.pi/2,
                    child: Text('hello world'),
                  ),
                )
            ),

            /// 缩放
            Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5, //放大到1.5倍
                    child: Text('hello world'),
                  ),
                )
            ),

            /// 因为是在绘制阶段，
            /// 所以占位大小不变，“你好”会紧贴红色背景，与“Hello world”文字重合
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                    decoration:BoxDecoration(color: Colors.red),
                    child: Transform.scale(scale: 1.5,
                        child: Text("Hello world")
                    )
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
              ],
            ),

            /// RotatedBox
            /// 与Transform.rotate功能相似
            /// 但是在布局阶段，所以会影响兹widget的位置与大小。
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //将Transform.rotate换成RotatedBox
                  child: RotatedBox(
                    quarterTurns: 1, //旋转90度(1/4圈)
                    child: Text("Hello world"),
                  ),
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
              ],
            ),
          ],
        ),

    );
  }
}
