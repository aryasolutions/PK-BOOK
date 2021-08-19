import 'package:flutter/material.dart';
import 'package:pk_book/login.dart';
import 'package:pk_book/main.dart';

class Logout extends StatefulWidget {
  const Logout({ Key? key }) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
    Logout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Logout();
    return Scaffold(
      body: Container(
        child:Center(child: Text("Logout")) ,
      ),
    );
  }
}