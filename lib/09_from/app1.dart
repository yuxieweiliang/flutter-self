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

class _ParentPageState extends State<ParentPage> {
  TextEditingController _unameController=new TextEditingController();


  @override
  void initState() {
    // 设置默认文本
    _unameController.text="hello world!";

    // 默认选中文本
    _unameController.selection=TextSelection(
        baseOffset: 2,
        extentOffset: _unameController.text.length
    );
    //监听输入改变
    _unameController.addListener((){
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {

    // 页面脚手架
    return Scaffold(
      appBar: AppBar( title: Text(widget.title),),

      // 主体
      body: new Column(
          children: <Widget>[
            TextField(
              textInputAction: TextInputAction.search,
              autofocus: true,
              controller: _unameController, //设置controller
              onChanged: (v) {
                print("onChange: $v");
              },
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),
          ]
      ),
    );
  }
}

// 暂时不知道 0xec7d 码，所以不成功
class EvilIcons{
  static const IconData home = const IconData(
      0xec7d,
      fontFamily: 'EvilIcons',
      matchTextDirection: true
  );
}