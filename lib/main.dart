import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:pk_book/Navigation.dart';
import 'dart:math';

import 'package:pk_book/PKBook.dart';
import 'package:pk_book/Profile.dart';
import 'package:pk_book/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
              home: Container(
            child: Center(child: Text("error")),
          ));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Container(
                child: Login(),
              ));
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
            home: Scaffold(
                body: Container(
          child: LoadingFadingLine.circle(
            duration: Duration(milliseconds: 500),
          ),
        )));
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double value = 0;
//   var Navigatio = 0;
//   String UserName = "User Name";
//   String UserProfile = "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=";


//   @override
//   Widget build(BuildContext context) {
//   //     Navigate(context) {
//   //   if (Navigatio == 0) {
//   //   Navigator.push(context, MaterialPageRoute(builder: (context) => PKBook()));
//   //   }
//   //   if(Navigatio == 1) {
//   //         Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
//   //   }
//   // }
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//               // Colors.blue[400],
//               // Colors.blue[800],
//               Color(0xff2979FF),
//               Color(0xff1565c0)
//             ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
//           ),
//           SafeArea(
//               child: Container(
//             width: 200.0,
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 // IconButton(onPressed: (){setState(() {
//                 //                  value = 0;
//                 // });}, icon: Icon(Icons.backspace)),
//                 DrawerHeader(
//                     child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 50.0,
//                       backgroundImage: NetworkImage(UserProfile),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Text(
//                       UserName,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ],
//                 )),
//                 Expanded(
//                     child: ListView(
//                   children: [
//                     ListTile(
//                       onTap: () {},
//                       leading: Icon(Icons.home, color: Colors.white),
//                       title: Text(
//                         'Home',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     ListTile(
//                       onTap: () {},
//                       leading: Icon(Icons.person, color: Colors.white),
//                       title: Text(
//                         'Profile',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     ListTile(
//                       onTap: () {},
//                       leading: Icon(Icons.settings, color: Colors.white),
//                       title: Text(
//                         'Settings',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     ListTile(
//                       onTap: () {},
//                       leading: Icon(Icons.logout, color: Colors.white),
//                       title: Text(
//                         'Log Out',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 )),
//               ],
//             ),
//           )),
//           TweenAnimationBuilder(
//               tween: Tween<double>(begin: 0, end: value),
//               duration: Duration(microseconds: 500),
//               curve: Curves.easeInExpo,
//               builder: (_, double val, __) {
//                 return (Transform(
//                   alignment: Alignment.center,
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, 0.001)
//                     ..setEntry(0, 3, 200 * val)
//                     ..rotateY((pi / 6) * val),
//                   child: Scaffold(
//                       // appBar: AppBar(
//                       //   title: Text('Arya Solutions'),
//                       // ),
//                       body: Login()
//                       // Center(
//                       //   child: Text(
//                       //     "Pakistan Zindabad",
//                       //     style: TextStyle(fontSize: 30),
//                       //   ),
//                       // ),

//                       ),
//                 ));
//               }),
//           GestureDetector(
//             onHorizontalDragUpdate: (e) {
//               // print(e.delta.dx);
//               if (e.delta.dx > 0) {
//                 setState(() {
//                   value = 1;
//                 });
//               } else {
//                 setState(() {
//                   value = 0;
//                 });
//               }
//               print(value);
//             },
//             // onTap: () {
//             //   setState(() {
//             //     value == 0 ? value = 1 : value = 0;
//             //   });
//             // },
//           )
//         ],
//       ),
//     );
//   }
// }
