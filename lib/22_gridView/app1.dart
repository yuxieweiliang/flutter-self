import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 这是 application 的 root widget
  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Demo';
    final theme = new ThemeData(primarySwatch: Colors.blue,);
    final home = new ParentPage(title: 'Row 对齐方式');

    return MaterialApp( title: title, theme: theme, home: home, );
  }
}

///
/// 数据 Widget
///
class ParentPage extends StatefulWidget {
  ParentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScaffoldRouteState createState() => new _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ParentPage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('App Name'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: (MediaQuery.of(context).size.height-24-56-56)/2,
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //横轴三个子widget
                    childAspectRatio: 1.0 //宽高比为1时，子widget
                ),
                children:<Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast)
                ]
            ),
          ),

          /// 等价于 GridView.count
          SizedBox(
            height: (MediaQuery.of(context).size.height-24-56-56)/2,
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),
          ),

        ],
      )
    );
  }
}
