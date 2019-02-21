import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildSuggestions() {

    // 初始化列表
    return new ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, i) {
        // 如果当前是 偶数的话，则创建一条横线
        if(i.isOdd) return new Divider();

        final index = i ~/ 2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase, // 首字母大写
        style: _biggerFont,
      ),

      // 添加右侧按钮
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      // 添加事件响应
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          } else {
           _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {

          final _biggerFonts = const TextStyle(fontSize: 18.0);
          final tiles = _saved.map((pair) {
            return ListTile(title: Text(pair.asPascalCase, style: _biggerFonts));// new Text(pair.asPascalCase, style: _biggerFonts)
          });

          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();


          print(divided);
          return new Scaffold(
            appBar: new AppBar(title: new Text('Save Suggestions')),
            body: new ListView(
                padding: const EdgeInsets.all(10),
                children: divided
            ),
            // body: new Text('hello word'),
          );
        },

      )
    );
  }
}



