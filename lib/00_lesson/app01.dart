import 'package:flutter/material.dart';
/// https://cloud.tencent.com/developer/ask/126961
/// https://flutterchina.club/widgets-intro/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: new Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}



