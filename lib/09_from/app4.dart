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
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    // 页面脚手架
    return Scaffold(
      appBar: AppBar( title: Text(widget.title),),

      // 主体
      body: new Padding(
        padding: EdgeInsets.all(20),
        child: new Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person)
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : '用户名不能为空！';
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "密码",
                      hintText: "您的登录密码",
                      hintStyle: TextStyle(color: Colors.red, fontSize: 13.0)
                  ),
                  obscureText: true, // 隐藏文本内容为 * 号
                  validator: (v) {
                    return v.trim().length > 5 ? null : '密码不能少于6位！';
                  },
                ),

                Padding(
                padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child:  RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text('登陆'),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                print(_formKey.currentState);
                                if((_formKey.currentState as FormState).validate()){
                                  //验证通过提交数据
                                }
                              }
                          )
                      ),
                    ],
                  ),
                )

        ],
        ),
      )
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