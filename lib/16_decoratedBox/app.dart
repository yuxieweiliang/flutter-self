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

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

Widget blueBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.blue),
);

class _ParentPageState extends State<ParentPage> {
  @override
  Widget build(BuildContext context) {

    // 页面脚手架
    return Scaffold(
        appBar: AppBar( title: Text(widget.title),),

        /// ConstrainedBox -> BoxConstraints
        body: Column(
          children: <Widget>[

            /// ConstrainedBox
            Padding(
              padding: EdgeInsets.all(10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("Login", style: TextStyle(color: Colors.blue),),
                ),
              ),
            ),

            /// ConstrainedBox
            DecoratedBox(
             decoration: BoxDecoration(
               gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
               borderRadius: BorderRadius.circular(3),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black54,
                   offset: Offset(2, 2),
                   blurRadius: 4
                 )
               ]
             ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("Login", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        )
    );
  }
}
