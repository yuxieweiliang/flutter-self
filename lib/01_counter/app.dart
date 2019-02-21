import 'package:flutter/material.dart';

// 应用启动入口
void main() => runApp(new MyApp());

// 应用实例 StatelessWidget：无状态
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 创建 app 实例
    return new MaterialApp(
      title: 'Flutter Demo',
      // 添加主题
      theme: new ThemeData(
        primarySwatch: Colors.blue, // 蓝色主题
      ),
      // 页面title
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// 应用MyHomePage实例 StatefulWidget：有状态
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override // 创建状态管理
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // 计数初始值

  void _incrementCounter() {
    setState(() {
      _counter++; // 计数自增
    });
  }

  @override // 需要实现的方法，渲染输出的结构
  Widget build(BuildContext context) {

    // 手脚架，包含了 appBar、body、bottomNavigationBar、floatingActionButton、floatingActionButtonLocation
    return new Scaffold(
      // 标题栏
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      // 主体部分
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
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
}