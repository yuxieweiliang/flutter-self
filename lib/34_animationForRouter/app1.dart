import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ThemeTestRoute(),
    );
  }
}
class ThemeTestRoute extends StatefulWidget {

  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

/// 路由
/// 自定义路由切换动画
class _ThemeTestRouteState extends State<ThemeTestRoute> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('page a'),
        RaisedButton(
          child: Text('to page b'),
          onPressed: () {

            /// CupertinoPageRoute 来自 import 'package:flutter/cupertino.dart'
            /// 使用 ios 风格 的左右切换;
            Navigator.push(context, CupertinoPageRoute(
                builder: (context){
                  return PageB(); //路由B
                }
            ));
          },
        )
      ],
    );
  }
}

class PageB extends StatelessWidget {
  PageB({Key key, String title}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('page b'),
          RaisedButton(
            child: Text('return button'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}