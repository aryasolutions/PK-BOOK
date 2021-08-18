import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pk_book/getdata.dart';
import 'dart:math';

import 'package:pk_book/input.dart';

class PKBook extends StatefulWidget {
  // const PKBook({Key? key}) : super(key: key);
  final String Name;
  final String Email;
  final String PhoneNo;
  final String UserProfile;
  PKBook({
    required this.Name,
    required this.Email,
    required this.PhoneNo,
    required this.UserProfile,
  });
  // PKBook({String, String? Email, String? Name, String? PhoneNo});

  @override
  _PKBookState createState() => _PKBookState();
}

class _PKBookState extends State<PKBook> {
  @override
  Widget build(BuildContext context) {
    var fdata = "";
    print("================PK Book widget=================>");
    print(widget.Name);
    print(widget.Email);
    print(widget.PhoneNo);
    // print(widget.);
    List<dynamic> posts = [
      [
        "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=",
        "Mudassir Mukhtar",
        "56m",
        "I Love Pakistan",
        "Following"
      ],
      [
        "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=",
        "Muhammad AZEEM",
        "5m",
        """I Love Pakistan, Pakistan Meri Jaan Ha, Pakistan Mujh Ko Dil O Jan Sa Piara Ha, Pakistan Zindabad.
Happy Independence Day """,
        "Following"
      ],
      [
        "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=",
        "Muhammad Saim",
        "5h",
        """Freedom in the Mind,
Faith in the words..
Pride in our Souls..
Lets salute the Nation on Inependence Day. """,
        "For You"
      ],
    ];

    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // data() async {
    //   final DocumentSnapshot snapshot = await firestore
    //       .collection("Posts")
    //       .doc("User Name12:50:49 Mon 16 Aug")
    //       .get();
    //   final data = snapshot.data();
    //   print("++++++++++++++++++Firebase Data+++++++++++++++++++++");
    //   await firestore
    //       .collection("Posts")
    //       .get()
    //       .then((snapshot) => snapshot.docs.forEach((element) {
    //             var fdata = element.data();
    //             print(fdata["username"]);
    //             print(fdata["email"]);
    //             print(fdata["SMS"]);
    //           }));
    //   // print(data);
    // }

    // data();
//     var Profile = [
//       "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=",
//       "",
//       "",
//       "",
//     ];
//     var Name = [
//       "Mudassir Mukhtar",
//       "Muhammad Azeem",
//       "Muhammad saim",
//       "Muhammad Fazan",
//       "Mudassir",
//     ];
//     var Time = [
//       "56m .",
//       "23m .",
//       "5h .",
//       "6s .",
//       "5m .",
//     ];
//     var Sms = [
//       "I Love Pakistan",
//       """I Love Pakistan, Pakistan Meri Jaan Ha, Pakistan Mujh Ko Dil O Jan Sa Piara Ha, Pakistan Zindabad.
// Happy Independence Day """,
//       """Freedom in the Mind,
// Faith in the words..
// Pride in our Souls..
// Lets salute the Nation on Inependence Day. """,
//       """Independence a Precious gift of God.
// May We Alwayzs Remain Independent.. Ameen
// A Very Happy Independence Day""",
//       """""",
//       """""",
//     ];

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
// posts(){
//       for (var i = 0; i < Sms.length; i++) {
//       Post(Profile[0], Name[0], Time[0], Sms[0], vwidth, vhight);
//     }
// }
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('PK Book')),
      //   leading:  IconButton(
      //       icon: const Icon(Icons.menu),
      //       tooltip: 'Main Menu',
      //       onPressed: () {

      //         // ScaffoldMessenger.of(context).showSnackBar(
      //         //     const SnackBar(content: Text('This is a snackbar')));
      //       },
      //     ),
      // ),
      //  body: ListView.builder(
      //     itemCount: posts.length,
      //     itemBuilder: (context, index) {
      //       return Post(posts[index][0], posts[index][1], posts[index][2],
      //           posts[index][3], vwidth, vhight);
      //     }),
      body: GetPostData()
      //  SingleChildScrollView(
      //   child: Center(
      //       child: Column(
      //     children: [
      //       TopBar(),
      //       input(
      //           Name: widget.Name,
      //           Email: widget.Email,
      //           PhoneNo: widget.PhoneNo,
      //           UserProfile: widget.UserProfile),
      //           GetPostData(),
      //       // SingleChildScrollView(
      //       //     child: Column(
      //       //   children: [
      //       //     // body: ListView.builder(
      //       //     // itemCount: posts.length,
      //       //     // itemBuilder: (context, index) {
      //       //     //   return Post(posts[index][0], posts[index][1], posts[index][2],
      //       //     //       posts[index][3], vwidth, vhight);
      //       //     // }),
      //       //     // Post(Profile[0], Name[0], Time[0], Sms[0], vwidth, vhight),
      //       //     // Post(Profile[0], Name[1], Time[1], Sms[1], vwidth, vhight),
      //       //     // Post(Profile[0], Name[3], Time[3], Sms[3], vwidth, vhight),
      //       //     Post(posts[0][0], posts[0][1], posts[0][2], posts[0][3], vwidth,
      //       //         vhight),
      //       //     Post(posts[1][0], posts[1][1], posts[1][2], posts[1][3], vwidth,
      //       //         vhight),
      //       //     Post(posts[2][0], posts[2][1], posts[2][2], posts[2][3], vwidth,
      //       //         vhight),
      //       //   ],
      //       // )),
         
      //     ],
      //   )),
      // ),
   
    );
  }
}

class UserProfile {}

/////////////////////////////////TopBar//////////////////////////////
class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  var bactive = Colors.blue[600];
  var dactive = Colors.white;
  String PostType = "For You";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 150,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(16.0),
            color: Colors.blue[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextButton(
                    onPressed: () {
                      print('=================================>');
                      print('pakistan');
                      setState(() {
                        bactive = Colors.white;
                        dactive = Colors.blue;
                        PostType = "Following";
                      });
                    },
                    child: Text(
                      "Following",
                      style: TextStyle(
                          color: bactive, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                width: 6,
              ),
              TextButton(
                  onPressed: () {
                    print('=================================>');
                    print("Zindabad");
                    setState(() {
                      bactive = Colors.blue;
                      dactive = Colors.white;
                      PostType = "For You";
                    });
                  },
                  child: Text(
                    "For You",
                    style:
                        TextStyle(color: dactive, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

final _random = Random();

Widget Post(String Profile, String Name, String Time, String Sms, var vwidth,
    var vhight) {
  return Container(
    // width: vwidth - 20,
    // height: vwidth,
    // decoration: new BoxDecoration(
    //   borderRadius: new BorderRadius.circular(16.0),
    //   color: Colors.blue[200],
    // ),
    child: Column(
      children: [
        Container(
          width: vwidth,
          height: 5,
          color: Colors.black12,
        ),
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(Profile),
                ),
              ),
            ),
            Container(
              width: vwidth / 1.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    Time,
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: vwidth - 30,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(16.0),
              // color: Colors.blue[200],
              color: Colors.primaries[_random.nextInt(Colors.primaries.length)],
              // [_random.nextInt(9) * 100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 70, bottom: 70),
              child: Text(Sms, textAlign: TextAlign.center),
            )),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    ),
  );
}
