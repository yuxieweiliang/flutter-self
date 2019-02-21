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
        child: new Column(
            children: <Widget>[
              TextField(
                textInputAction: TextInputAction.search,
                autofocus: true,
                focusNode: focusNode1,//关联focusNode1
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
                focusNode: focusNode2,//关联focusNode2
                textInputAction: TextInputAction.search,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true,
              ),
              Builder(builder: (ctx) {
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('移动焦点'),
                      onPressed: () {
                        if(null == focusScopeNode) {
                          focusScopeNode = FocusScope.of(context);
                        }
                        focusScopeNode.requestFocus(focusNode2);
                      },
                    ),
                    RaisedButton(
                      child: Text('隐藏键盘'),
                      onPressed: () {
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      },
                    )
                  ],
                );
              })
            ]
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