import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

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

/// Hero动画
class _ThemeTestRouteState extends State<ThemeTestRoute> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: Material(

          child: InkWell(
            child: Hero(
              tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset("images/avatar.jpg",
                  width: 150.0,
                ),
              ),
            ),
            onTap: () {
              //打开B路由
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return new FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        appBar: AppBar(title: Text('原图')),
                        body: HeroAnimationRouteB(),
                      ),
                    );
                  })
              );
            },
          ),
          color: Colors.blue,
        )

    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("images/avatar.jpg"),
      ),
    );
  }
}