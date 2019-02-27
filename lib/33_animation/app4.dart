import 'package:flutter/material.dart';

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

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  Widget build( BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset(
          'images/avatar.jpg',
          width: animation.value,
          height: animation.value
      ),
    );
  }
}

class _ThemeTestRouteState extends State<ThemeTestRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // 图标宽度从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() => {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset('images/avatar.jpg'),
      builder: (BuildContext ctx, Widget child) {

        /// 注意 !!!
        /// 这里必须是Center包裹控件，否则单独Container是不会发生动画的。
        return Center(
          child: new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}