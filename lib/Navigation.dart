import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pk_book/Logout.dart';
import 'package:pk_book/Navigation.dart';
import 'dart:math';

import 'package:pk_book/PKBook.dart';
import 'package:pk_book/Profile.dart';
import 'package:pk_book/Setting.dart';
import 'package:pk_book/login.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  final String Name;
  final String Email;
  final String PhoneNo;
  final String UserProfile;
  // ignore: non_constant_identifier_names
  HomePage(
      {required this.Name,
      required this.Email,
      required this.PhoneNo,
      required this.UserProfile});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  var Navigatio = 0;
  int _selectedIndex = 0;
  String Name = '';
  static const List<Widget> _widgetOptions = <Widget>[
    Setting(),
    UserProfilePage(
        Name: "Name",
        Email: "Email",
        PhoneNo: 'PhoneNo',
        UserProfile: 'UserProfile'),
    Logout()
  ];

  @override
  Widget build(BuildContext context) {
    // print("================HomePage widget=========$_selectedIndex========>");
    // print(widget.Name);
    // print(widget.Email);
    // print(widget.PhoneNo);
    // print(widget.UserProfile);
    //     Navigate(context) {
    //   if (Navigatio == 0) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => PKBook()));
    //   }
    //   if(Navigatio == 1) {
    //         Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
    //   }
    // }
    return Center(
      child: Container(
                              constraints: BoxConstraints(maxWidth: 600),
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  // Colors.blue[400],
                  // Colors.blue[800],
                  Color(0xff2979FF),
                  Color(0xff1565c0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
              ),
              SafeArea(
                  child: Container(
                width: 200.0,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // IconButton(onPressed: (){setState(() {
                    //                  value = 0;
                    // });}, icon: Icon(Icons.backspace)),
                    DrawerHeader(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(widget.UserProfile),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.Name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                    Expanded(
                        child: ListView(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                    Name: widget.Name,
                                    Email: widget.Email,
                                    PhoneNo: widget.PhoneNo,
                                    UserProfile: widget.UserProfile),
                              ),
                            );
                          },
                          leading: Icon(Icons.home, color: Colors.white),
                          title: Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserProfilePage(
                                Name: widget.Name,
                                Email: widget.Email,
                                PhoneNo: widget.PhoneNo,
                                UserProfile: widget.UserProfile),
                              ),
                            );
                            // setState(() {
                            //   _selectedIndex = 1;
                            // });
                          },
                          leading: Icon(Icons.person, color: Colors.white),
                          title: Text(
                            'Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Setting(),
                              ),
                            );
                            // setState(() {
                            //   _selectedIndex = 0;
                            // });
                          },
                          leading: Icon(Icons.settings, color: Colors.white),
                          title: Text(
                            'Settings',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Logout(),
                              ),
                            );
                            // setState(() {
                            //   _selectedIndex = 2;
                            // });
                          },
                          leading: Icon(Icons.logout, color: Colors.white),
                          title: Text(
                            'Log Out',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              )),
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: value),
                  duration: Duration(microseconds: 500),
                  curve: Curves.easeInExpo,
                  builder: (_, double val, __) {
                    return (Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(0, 3, 200 * val),
                      // ..rotateY((pi / 6) * val),
                      child: Scaffold(
                          appBar: AppBar(
                            title: Center(child: Text('LinkedUp')),
                            leading: IconButton(
                              icon: const Icon(Icons.menu),
                              tooltip: 'Main Menu',
                              onPressed: () {
                                if (value == 0) {
                                  setState(() {
                                    value = 1;
                                  });
                                } else {
                                  setState(() {
                                    value = 0;
                                  });
                                }
                                print(value);
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     const SnackBar(content: Text('This is a snackbar')));
                              },
                            ),
                          ),
                          // body: _widgetOptions.elementAt(_selectedIndex),
                          body: PKBook(
                              Name: widget.Name,
                              Email: widget.Email,
                              PhoneNo: widget.PhoneNo,
                              UserProfile: widget.UserProfile)),
                    ));
                  }),
              GestureDetector(
                onHorizontalDragUpdate: (e) {
                  // print(e.delta.dx);
                  if (e.delta.dx > 0) {
                    setState(() {
                      value = 1;
                    });
                  } else {
                    setState(() {
                      value = 0;
                    });
                  }
                  print(value);
                },
                // onTap: () {
                //   setState(() {
                //     value == 0 ? value = 1 : value = 0;
                //   });
                // },
              )
            ],
          ),
        ),
      ),
    );
  }
}
