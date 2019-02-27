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
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, // 未定位widget沾满Stack整个空间
        children: <Widget>[
          Positioned(
            left: 18,
            child: Text('I am Jack'),
          ),
          Container(
            child: Text('Hellow World', style: TextStyle(color: Colors.white),),
            color: Colors.red,
          ),
          Positioned(
            top: 18,
            child: Text('Your friend'),
          )
        ],
      )
    );
  }
}
