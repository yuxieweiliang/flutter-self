import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

/// 第一次运行时：
/// I/flutter ( 5436): initState
/// I/flutter ( 5436): didChangeDependencies
/// I/flutter ( 5436): build
///
/// 点击热替换时，代码改动时
/// I/flutter ( 5436): reassemble #
/// I/flutter ( 5436): didUpdateWidget
/// I/flutter ( 5436): build
///
/// 移除组件时
/// I/flutter ( 5436): reassemble
/// I/flutter ( 5436): deactive # 当State对象从树中被移除时，会调用此回调。
/// I/flutter ( 5436): dispose # 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
///
/// # reassemble是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    //初始化状态
    print("initState");
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
      body: new Text(
          'ffffffff $_counter',
        style: Theme.of(context).textTheme.display2,
      ),

      // 悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}



