import 'package:flutter/material.dart';
import 'dart:math' as math;
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
  _ScaffoldRouteState createState() => new _ScaffoldRouteState();
}

/// 实例：
/// 无限加载列表
/// 添加表头
class _ScaffoldRouteState extends State<ParentPage> with SingleTickerProviderStateMixin{
  static const loadingTag = "##loading##"; //表尾loading标记
  var _words = <String>[loadingTag];

  @override
  void initState() {

    // 第一次加载数据
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('App Name'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title:Text("商品列表")),

          /// 列表高度通过 屏幕高度计算得出
          /// 然而此方法并不优雅，如果标题高度改变，列表高度也需要重新计算
          /// 所以最好还是使用 flex Expanded
          Expanded(
            child: ListView.separated(
              itemCount: _words.length,
              itemBuilder: (context, index) {

                /// 每次滑动的时候，都会触发此函数
                /// 可以检测如果当前还有10条未加载的时候
                /// 然后更新数据，就不会出现 loading 图标了。

                //如果到了表尾
                if (_words[index] == loadingTag) {
                  //不足100条，继续获取数据
                  if (_words.length - 1 < 100) {
                    //获取数据
                    _retrieveData();
                    //加载时显示loading
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0)
                      ),
                    );
                  } else {
                    //已经加载了100条数据，不再获取数据。
                    return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16.0),
                        child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
                    );
                  }
                }

                //显示单词列表项
                return ListTile(title: Text(_words[index]));
              },
              separatorBuilder: (context, index) => Divider(height: .0),
            ),
          )
        ],
      ),
    );
  }


  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }

}
