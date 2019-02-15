import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    title: 'Test Animation',
    theme: new ThemeData(
      primaryColor: Colors.green,
    ),
    home: AnimationTest(
       
    )
  ));
}

class AnimationTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Test of Animation',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnimationStateW(),
    );
  }
}

class AnimationTestState extends State<AnimationStateW> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000),vsync: this);
    curve = CurvedAnimation(parent: controller,curve: Curves.ease);
  }
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('state title'),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(
              size: 95,
          )))),
          floatingActionButton: FloatingActionButton(
            tooltip: 'fade',
            child: Icon(Icons.brush),
            onPressed: (){
              controller.forward();
            },
          ),
    );
  }

}

class AnimationStateW extends StatefulWidget{
    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationTestState();
  }
}
