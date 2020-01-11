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

class FadeRoute extends PageRoute{
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;
  @override
  final bool opaque;
  @override
  final bool barrierDismissible;
  @override
  final Color barrierColor;
  @override
  final String barrierLabel;
  @override
  final bool maintainState;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation
      ) => builder(context);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondayAnimation,
      Widget child) {

    /// 返回不使用动画
    /// 检查当前路由 isActive 是否为 true
    /// 否则 直接返回
    if(isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      return Padding(padding: EdgeInsets.zero);
    }

  }
}


/// 路由
/// 使用渐隐渐现风格
class _ThemeTestRouteState extends State<ThemeTestRoute>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Text('page a'),
        RaisedButton(
          child: Text('to page b'),
          onPressed: () {

            /// 使用 PageRout 完全自定义路由
            Navigator.push(context, FadeRoute(
              builder: (context) {
                return new PageB();
              },
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