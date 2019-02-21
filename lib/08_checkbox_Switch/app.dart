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
  bool _switch = false;
  bool _checked = false;
  bool _checked2 = false;

  @override
  Widget build(BuildContext context) {

    // 页面脚手架
    return Scaffold(
      appBar: AppBar( title: Text(widget.title),),

      // 主体
      body: new Column(
        children: <Widget>[
          Switch(
            value: _switch,
              onChanged: (value) {
                setState(() {
                  _switch = value;
                });
              },
          ),
          Checkbox(
            value: _checked,
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                _checked = value;
              });
            },
          ),
          Checkbox(
            value: _checked2,
            tristate: true,
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                _checked2 = value;
              });
            },
          )
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