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

    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.red,);
    Widget divider2=Divider(color: Colors.blue);

    return Scaffold(
      appBar: AppBar(
        title: new Text('App Name'),
      ),
      body: ListView.separated(
        itemCount: 100,

        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },

        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {

          // 分割器为线条
          return index%2==0?divider1:divider2; // new Text('ffffffffffffffffffffffffff');
        },
      ),
    );
  }
}
