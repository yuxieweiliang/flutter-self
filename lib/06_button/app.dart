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
      home: ParentPage(title: 'Flutter Demo Home Page'),
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
        children: [
          new RaisedButton(
            child: Text("normal"),
            onPressed: () => {},
          ),
          new FlatButton(
            child: Text("normal"),
            onPressed: () => {},
          ),
          new OutlineButton(
            child: Text("normal"),
            onPressed: () => {},
          ),


          new IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => {},
          ),

          // 纯扁平按钮
          new FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark, // 按钮主题，文字为浅色
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () => {},
          ),

          // 带质感以及默认阴影的按钮
          new RaisedButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark, // 按钮主题，文字为浅色
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () => {},
          ),

          // 阴影状态
          new RaisedButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark, // 按钮主题，文字为浅色
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            elevation   : 8, //正常状态下的阴影 default 2
            highlightElevation   : 2, // 按下时的阴影 default 8
            onPressed: () => {},
          ),

          // 没有 onPressed 则为禁用状态
          new RaisedButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            splashColor: Colors.grey,
            child: Text("desabed"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            disabledElevation   : 4, //正常状态下的阴影
          ),
        ]
      ),
    );
  }
}
