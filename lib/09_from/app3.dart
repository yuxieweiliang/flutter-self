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
      home: ParentPage(title: '修改 input 默认样式'),
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
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 监听焦点变化
    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {

    // 页面脚手架
    return Scaffold(
      appBar: AppBar( title: Text(widget.title),),

      // 主体
      body: new Padding(
        padding: EdgeInsets.all(20),
        child: new Theme(
            data: Theme.of(context).copyWith(
                hintColor: Colors.grey[200], //定义下划线颜色
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.grey),//定义label字体样式
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)//定义提示文本样式
                )
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person)
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "密码",
                      hintText: "您的登录密码",
                      hintStyle: TextStyle(color: Colors.red, fontSize: 13.0)
                  ),
                  obscureText: true,
                )
              ],
            )
        ),
      )
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