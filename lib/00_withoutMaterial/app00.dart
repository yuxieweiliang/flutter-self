import 'package:flutter/material.dart';
/// https://cloud.tencent.com/developer/ask/126961
/// https://flutterchina.club/widgets-intro/
void main() => runApp(MyApp());

/// 【 error 】 在 StatelessWidget 中直接使用 Text 会报错
/// no widget found TichText widgets require a directionality widget ancestor
/// 发现TichText小部件需要方向性小部件祖先 { 需要指明方向 }
/// 推荐使用 Scaffold、material，
/// 则不需要在文本小部件中指定textDirection，因为在这些情况下，方向性是隐式提供的。
/// 因此，一个好的解决方案是使用：
///
/// Scaffold(body: Text("xyz"))
///
/// 如果你没有使用它，那么你需要：
///
/// Text(
///   'xyz',
///   textDirection: TextDirection.ltr,
/// )
///
/// 或者：
///
/// Directionality(
///   textDirection: TextDirection.ltr,
///   child: Text('Click')
/// )
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
          margin: EdgeInsets.only(top: 5.0, left: 120.0), //容器外补白
          constraints: BoxConstraints.tightFor(width: 300.0, height: 600.0), //卡片大小
          decoration: BoxDecoration(//背景装饰
              gradient: RadialGradient( //背景径向渐变
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.topLeft,
                  radius: .98
              ),
              boxShadow: [ //卡片阴影
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0
                )
              ]
          ),
          transform: Matrix4.rotationZ(.2), //卡片倾斜变换
          alignment: Alignment.center, //卡片内文字居中
          child: Column(
            children: <Widget>[
              Text('默认文本显示',),
              Text('文本大小设置',
                style: TextStyle(fontSize: 20,),
              ),
              Text(
                '这一行文本是：当字数太多，屏幕宽度着不下的时候在文本最后显示省略号',
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '文本添加背景颜色',
                style: TextStyle(backgroundColor: Color.fromARGB(88, 255, 0, 0)),
              ),
              /*Text(
              '文本添加前景颜色',
              style: TextStyle(foreground: pf),
            ),*/
              Text(
                '文本添加颜色',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(100, 0, 0, 128)
                ),
              ),
              Text(
                '文本添加下划线',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              Text(
                '文本添加上划线',
                style: TextStyle(decoration: TextDecoration.overline),
              ),
              Text(
                '文本添加删除/中划线',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              Text(
                '文本划线颜色',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xffff0000)
                ),
              ),
              Text(
                '文本两条下划线',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.double,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                '文本虚线下划线',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.dashed,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                '文本点线下划线',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.dotted,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                '文本实线下划线',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                '文本波浪线下划线',
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.wavy,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                '文本默认加粗',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '文本粗细比重 w100 -- w900',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              Text(
                '文本斜体字',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                '单词之间间隔，中文无效。How are you',
                style: TextStyle(wordSpacing: 20),
              ),
              Text(
                '文本字与字之间间隔',
                style: TextStyle(letterSpacing: 20),
              ),
              Text(
                '文本行高（字体倍数）',
                style: TextStyle(height: 1.5),
              ),

            ],
          )
      ),
    );
  }
}



