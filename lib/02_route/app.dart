import 'package:flutter/material.dart';

void main() => runApp(new InitApp());

class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'route demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'routes for flutter demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '432432',
              style: Theme.of(context).textTheme.overline,
            ),
          ],
        ),
      ),
      // 悬浮按钮
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter, // 悬浮按钮点击事件
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  _incrementCounter() {
    Navigator.push( context,
        new MaterialPageRoute(builder: (context) {
          return new OtherPage();
        }));
  }
}

class OtherPage extends StatefulWidget {
  OtherPage({Key key, this.title}) : super(key: key);
  final String title;

  _OtherPage createState() => new _OtherPage();
}


class _OtherPage extends State<OtherPage> {
  @override build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('other title')),
      body: new Text('fffffffffffffffffffffff'),
    );
  }
}
