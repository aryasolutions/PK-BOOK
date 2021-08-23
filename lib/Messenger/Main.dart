import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class Main extends StatefulWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Center(
              child: Column(
        children: [LoadingFadingLine.circle(), Text("Coming Soon...")],
      ))),
    );
  }
}