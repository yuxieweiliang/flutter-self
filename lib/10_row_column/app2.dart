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

      // 主体
      body: new Column(
          children: <Widget>[
            Container(
              color: Colors.green,
              child: new Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                      color: Colors.red,
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text('hello world'),
                          new Text('I am Jack'),
                        ],
                      )
                  )
              ),
            ),

            Container(
              color: Colors.green,
              child: new Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                      color: Colors.red,
                      child:   Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text('hello world'),
                          new Text('I am Jack'),
                        ],
                      )
                  )
              ),
            ),


            Container(
              color: Colors.green,
              child: new Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                      color: Colors.red,
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          new Text('hello world'),
                          new Text('I am Jack'),
                        ],
                      )
                  )
              ),
            ),

            Container(
              color: Colors.green,
              child: new Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                      color: Colors.red,
                      child:   Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        verticalDirection: VerticalDirection.up,
                        children: <Widget>[
                          new Text('hello world', style: TextStyle(fontSize: 40),),
                          new Text('I am Jack'),
                        ],
                      )
                  )
              ),
            ),
          ]
      ),
    );
  }
}

// 暂时不知道 0xec7d 码，所以不成功
class EvilIcons{
  static const IconData home = const IconData(
      0xec7d,
      fontFamily: 'EvilIcons',
      matchTextDirection: true
  );
}