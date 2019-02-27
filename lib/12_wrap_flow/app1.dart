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
        body: Column(
          children: <Widget>[
            Wrap(
              spacing: 8, // 主轴（水平）方向间距
              runSpacing: 4, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, // 沿主轴方向居中
              children: <Widget>[
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A'),),
                  label: new Text('Hamilton'),
                ),
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A'),),
                  label: new Text('Hamilton'),
                ),
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A'),),
                  label: new Text('Hamilton'),
                ),
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A'),),
                  label: new Text('Hamilton'),
                ),
              ],
            ),
          ],
        )
    );
  }
}
