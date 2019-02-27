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

            /// ConstrainedBox
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 50.0 //最小高度为50像素
              ),
              child: Container(
                  height: 5.0,
                  child: redBox
              ),
            ),

            /// ConstrainedBox 多重限制
            /// 取其中比较大的一个
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                  child: blueBox,
                )
            ),
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 20.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 60.0),
                  child: redBox,
                )
            ),

            /// UnconstrainedBox
            /// 清除限制
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
                child: UnconstrainedBox( //“去除”父级限制
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                    child: redBox,
                  ),
                )
            ),

            /// SizedBox
            SizedBox(
                width: 80.0,
                height: 80.0,
                child: redBox
            ),

          ],
        )
    );
  }
}
