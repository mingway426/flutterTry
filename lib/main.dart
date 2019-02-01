import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      home: Counter(),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

class CountInteruption extends StatelessWidget{
  CountInteruption({this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }

}

class _CounterState extends State<Counter>{
   int _count = 0;
   
   void _increment(){
     setState(() {
        ++_count;
     });
   }

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
       CountInteruption(onPressed: _increment),
       ShowCount(count: _count),
      ],
    );
  }
}

class Counter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CounterState();
}

class ShowCount extends StatelessWidget{
  ShowCount({this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(' count : $count');
  }

}