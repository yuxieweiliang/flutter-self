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


/// active 状态在父组件ParentPage中，所以父组件继承 StatefulWidget；
/// 而子组件 ChildPage 只包含组件自身配置信息，根据父组件的状态改变自身展示内容。
/// 类似于 react 的 props；
class _ParentPageState extends State<ParentPage> {
  int _counter = 0;
  bool _activeA = false;
  bool _activeB = false;

  void _handleTapAChanged(bool newValue) {
    setState(() {
      _activeA = newValue;
    });
  }
  void _handleTapBChanged(bool newValue) {
    setState(() {
      _activeB = newValue;
    });
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    print("build");
    // 页面脚手架
    return Scaffold(
      // 标题
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // 主体
      body: new Column(
        children: [
          new Text(
            'ffffffff $_counter',
            style: Theme.of(context).textTheme.display2,
          ),
          new ChildPageA(active: _activeA, onChanged: _handleTapAChanged),
          new ChildPageB(active: _activeB, onChanged: _handleTapBChanged),
        ]
      ),

      // 悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ChildPageA extends StatelessWidget {
  ChildPageA({Key key, this.active: false, @required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: _handleTap,
        child: new Container(
            child: new Center(
                child: new Text(
                    (active ? 'Active' : 'Inactive') + ('（点我）'),
                    style: new TextStyle(fontSize: 32, color: Colors.red)
                )
            )
        )
    );
  }
}

/// B 组件为 一部分状态从父组件获取（active）， 一部分状态包含在组件内部（_highlight）
class ChildPageB extends StatefulWidget {
  ChildPageB({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _ChildBState createState() => new _ChildBState();
}


class _ChildBState extends State<ChildPageB> {
  bool _highlight = false;

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
        onTapDown: _handleTapDown, // 处理按下事件
        onTapUp: _handleTapUp, // 处理抬起事件
        onTap: _handleTap,
        onTapCancel: _handleTapCancel,
        child: new Container(
            child: new Center(
                child: new Text(
                    (widget.active ? 'Active' : 'Inactive') + ('（点我）'),
                    style: new TextStyle(fontSize: 32, color: Colors.red)
                )
            ),
          width: 300,
            height: 150,
          decoration: new BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
              ? new Border.all(
              color: Colors.teal[700],
              width: 10,
            )
            : null,
          ),

        )
    );
  }
}
