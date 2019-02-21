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
  String icons = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
  }

  @override
  Widget build(BuildContext context) {

    // 页面脚手架
    return Scaffold(
      appBar: AppBar( title: Text(widget.title),),

      // 主体
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Image(
                  image: AssetImage("images/avatar.jpg"),
                  width: 80.0
              ),
              new Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 80.0,
              ),
              new Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 80.0,
              ),
              new Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 80.0, //图片的宽
                height: 80, //图片高度
                color: Colors.blue, //图片的混合色值
                colorBlendMode:  BlendMode.difference, //混合模式
                //alignment = Alignment.center, //对齐方式
                //repeat = ImageRepeat.noRepeat, //重复方式
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 80, //图片的宽
                height: 80, //图片高度
                fit: BoxFit.contain,//缩放模式
                //alignment = Alignment.center, //对齐方式
                //repeat = ImageRepeat.noRepeat, //重复方式
              ),
              new Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 140, //图片的宽
                height: 60, //图片高度
                fit: BoxFit.contain,//缩放模式
                alignment: Alignment.center, //对齐方式
                //repeat = ImageRepeat.noRepeat, //重复方式
              ),
              new Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 140, //图片的宽
                height: 60, //图片高度
                fit: BoxFit.cover,//缩放模式
                alignment: Alignment.center, //对齐方式
                //repeat = ImageRepeat.noRepeat, //重复方式
              ),

            ],
          ),
          new Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 200, //图片的宽
            height: 80, //图片高度
            fit: BoxFit.contain,//缩放模式
            alignment: Alignment.center, //对齐方式
            repeat: ImageRepeat.repeatX , //重复方式
          ),
          Text(icons,
            style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.accessible,color: Colors.green,),
              Icon(Icons.error,color: Colors.green,),
              Icon(Icons.fingerprint,color: Colors.green,),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(EvilIcons.home,color: Colors.green,),
              Icon(Icons.error,color: Colors.green,),
              Icon(Icons.fingerprint,color: Colors.green,),
            ],
          )
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