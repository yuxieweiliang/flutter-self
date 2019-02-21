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
          new Text(
            'Hello world'*7,
          ),
          new Text(
            'Hello world'*7,
            textAlign: TextAlign.center, // left | right
          ),
          new Text(
            'Hello world'*7,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          new Text(
            'Hello world',
            textScaleFactor: 1.5, // 文本比例
          ),
          new Text(
            'Hello world',
            textScaleFactor: 1.5, // 文本比例
            style: TextStyle(
              fontFamily: 'Kaiju'
            ),
          ),
          new Text(
            'Hello world',
            style: Theme.of(context).textTheme.display2,
          ),
          new Text(
            'Hello world',
            style:  TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color=Colors.yellow,
                decoration:TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
            ),
          ),
          new Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: "Home: "
                ),
                TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(
                        color: Colors.blue
                    ),
                ),
              ]
          )),
          new DefaultTextStyle(
            //1.设置文本默认样式
            style: TextStyle(
              color:Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello world"),
                Text("I am Jack"),
                Text("I am Jack",
                  style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
