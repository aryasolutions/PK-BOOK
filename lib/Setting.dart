import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Center(
              child: Column(
        children: [LoadingFadingLine.circle(), Text("Coming Sone.")],
      ))),
    );
  }
}
