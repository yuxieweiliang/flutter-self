import 'package:flutter/material.dart';
import 'dart:math' as math;

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
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100, // 会根据总宽度除以当前最大宽度，450/100 || 960/100
                      childAspectRatio: 2 //宽高比为1时，子widget
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

            /// 等价于 GridView.extent
            SizedBox(
              height: (MediaQuery.of(context).size.height-24-56-56)/2,
              child: GridView.extent(
                maxCrossAxisExtent: 100.0,
                childAspectRatio: 2,
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
