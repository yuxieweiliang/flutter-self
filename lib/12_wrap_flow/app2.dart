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
      home: ParentPage(title: 'Row 对齐方式'),
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
  @override
  Widget build(BuildContext context) {

    // 页面脚手架
    return Scaffold(
      appBar: AppBar( title: Text(widget.title),),

      // 主体
      body: new Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          new Container(width: 80.0, height:80.0, color: Colors.red,),
          new Container(width: 80.0, height:80.0, color: Colors.green,),
          new Container(width: 80.0, height:80.0, color: Colors.blue,),
          new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
          new Container(width: 80.0, height:80.0, color: Colors.brown,),
          new Container(width: 80.0, height:80.0,  color: Colors.purple,),
        ],
      )
    );
  }
}

// 暂时不知道 0xec7d 码，所以不成功
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    print(context.size);
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}