import 'package:flutter/material.dart';
/// https://cloud.tencent.com/developer/ask/126961
/// https://flutterchina.club/widgets-intro/
void main() => runApp(MyApp());



class Person {
  String data;
  int age;
  String name;
  Person(data, {this.age, this.name}) {
    this.age = age;
    this.name = name;
    print('person');
    print('person $age');
    print('person $name');
  }
  void sayhi() {
    print('my name is' + this.name);
  }
}

class Worker extends Person {
  int salary;
  Worker(int age, String name, int salary) : super('xxx', age: age, name: name) { //super表示要继承父类的属性
    this.salary = salary;
    print('Worker');
    print('Worker $age');
    print('Worker $name');
    print(salary);
  }

  @override //告诉编译器和程序员他是一个重写覆盖父类的方法
  void sayhi() {
    super.sayhi(); //表示调用父类的sayhi方法
    print('my salary is $salary');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var woker = new Worker(1, 'xx', 2);
    woker.sayhi();

    return  Container(
        margin: EdgeInsets.only(top: 5.0, left: 120.0), // 容器外补白
        constraints: BoxConstraints.tightFor(width: 300.0, height: 600.0), // 卡片大小
        decoration: BoxDecoration(//背景装饰
            gradient: RadialGradient( //背景径向渐变
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98
            ),
            boxShadow: [ //卡片阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
              )
            ]
        ),
        transform: Matrix4.rotationZ(.2), //卡片倾斜变换
        alignment: Alignment.center, //卡片内文字居中
        child: Column(
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Text(
              '默认文本显示',
              textDirection: TextDirection.ltr,
            ),
            Text('文本大小设置',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 20,),
            ),
            Text(
              '这一行文本是：当字数太多，屏幕宽度着不下的时候在文本最后显示省略号',
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '文本添加背景颜色',
              textDirection: TextDirection.ltr,
              style: TextStyle(backgroundColor: Color.fromARGB(88, 255, 0, 0)),
            ),
            /*Text(
              '文本添加前景颜色',
              style: TextStyle(foreground: pf),
            ),*/
            Text(
              '文本添加颜色',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(100, 0, 0, 128)),
            ),
            Text(
              '文本添加下划线',
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            Text(
              '文本添加上划线',
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.overline),
            ),
            Text(
              '文本添加删除/中划线',
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            Text(
              '文本划线颜色',
              textDirection: TextDirection.ltr,
              style: TextStyle(decoration: TextDecoration.underline,decorationColor: Color(0xffff0000)),
            ),
            Text(
              '文本两条下划线',
              textDirection: TextDirection.ltr,
              style: TextStyle(decorationStyle: TextDecorationStyle.double,fontSize: 18, decoration: TextDecoration.underline,),
            ),
            Text(
              '文本虚线下划线',
              textDirection: TextDirection.ltr,
              style: TextStyle(decorationStyle: TextDecorationStyle.dashed,fontSize: 18,decoration: TextDecoration.underline,),
            ),
            Text(
              '文本点线下划线',
              textDirection: TextDirection.ltr,
              style: TextStyle(decorationStyle: TextDecorationStyle.dotted,fontSize: 18,decoration: TextDecoration.underline,),
            ),
            Text(
              '文本实线下划线',
              textDirection: TextDirection.ltr,
              style: TextStyle(decorationStyle: TextDecorationStyle.solid,fontSize: 18,decoration: TextDecoration.underline,),
            ),
            Text(
              '文本波浪线下划线',
              textDirection: TextDirection.ltr,
              style: TextStyle(decorationStyle: TextDecorationStyle.wavy,fontSize: 18,decoration: TextDecoration.underline,),
            ),
            Text(
              '文本默认加粗',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '文本粗细比重 w100 -- w900',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            Text(
              '文本斜体字',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(
              '单词之间间隔，中文无效。How are you',
              textDirection: TextDirection.ltr,
              style: TextStyle(wordSpacing: 20),
            ),
            Text(
              '文本字与字之间间隔',
              textDirection: TextDirection.ltr,
              style: TextStyle(letterSpacing: 20),
            ),
            Text(
              '文本行高（字体倍数）',
              textDirection: TextDirection.ltr,
              style: TextStyle(height: 1.5),
            ),

          ],
        )
    );
  }
}
