import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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

class _ParentPageState extends State<ParentPage> {
  @override
  Widget build(BuildContext context) {

    // 页面脚手架
    return Scaffold(
        appBar: AppBar( title: Text(widget.title),),


        /// Padding({
        /// ...
        /// EdgeInsetsGeometry padding,
        /// Widget child,
        /// })
        body: Padding(

          /// EdgeInsets.all(double value)
          /// 所有方向均使用相同数值的补白。
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(

                /// EdgeInsets.only({left, top, right ,bottom })
                /// 可以设置具体某个方向的补白(可以同时指定多个方向)。
                padding: EdgeInsets.only(left: 100),
                child: Text("Hello world"),
              ),
              Padding(

                /// EdgeInsets.symmetric({ vertical, horizontal })
                /// 用于设置对称方向的补白，vertical指top和bottom，horizontal指left和right。
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text("I am Jack"),
              ),
              Padding(

                /// EdgeInsets.fromLTRB(double left, double top, double right, double bottom)
                /// 分别指定四个方向的补白。
                padding: EdgeInsets.fromLTRB(20, 30, 40, 50),
                child: Text('Your friend'),
              )
            ],
          )
        )
    );
  }
}
