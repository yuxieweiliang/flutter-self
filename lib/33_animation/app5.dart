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

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build( BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child
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
    return GrowTransition(
      animation: animation,
      child: Image.asset('images/avatar.jpg'),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}