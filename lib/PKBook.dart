import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pk_book/PostProfile.dart';
import 'package:pk_book/Profile.dart';
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

//     List<dynamic> posts = [
//       [
//         "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=",
//         "Mudassir Mukhtar",
//         "56m",
//         "I Love Pakistan",
//         "Following"
//       ],
//       [
//         "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=",
//         "Muhammad AZEEM",
//         "5m",
//         """I Love Pakistan, Pakistan Meri Jaan Ha, Pakistan Mujh Ko Dil O Jan Sa Piara Ha, Pakistan Zindabad.
// Happy Independence Day """,
//         "Following"
//       ],
//       [
//         "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=",
//         "Muhammad Saim",
//         "5h",
//         """Freedom in the Mind,
// Faith in the words..
// Pride in our Souls..
// Lets salute the Nation on Inependence Day. """,
//         "For You"
//       ],
//     ];

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
    return Center(
      child: Container(
        width: 600,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
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
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                        widget.UserProfile,
                      ),
                    ),
                  ),
                ),
              ),

              title: Center(
                child: input(
                    Name: widget.Name,
                    Email: widget.Email,
                    PhoneNo: widget.PhoneNo,
                    UserProfile: widget.UserProfile),
              ),
              // title: Center(child: Text('PK Book')),
              // leading:  IconButton(
              //     icon: const Icon(Icons.menu),
              //     tooltip: 'Main Menu',
              //     onPressed: () {

              //       // ScaffoldMessenger.of(context).showSnackBar(
              //       //     const SnackBar(content: Text('This is a snackbar')));
              //     },
              //   ),
            ),
            body: GetPostData(
              username: widget.Name,
            )
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

            ),
      ),
    );
  }
}

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

// Widget Post(
//     String Profile,
//     String username,
//     String Name,
//     String Email,
//     String Time,
//     String Sms,
//     String PhoneNo,
//     var vwidth,
//     var vhight,
//     var context) {
//   String PPhoneNo = 'Show Only me';
//   // if (username == Name) {
//   //       PPhoneNo = PhoneNo;
//   // }
//   gotoprofile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PostProfilePage(
//             Name: Name, Email: Email, PhoneNo: PPhoneNo, UserProfile: Profile),
//       ),
//     );
//   }

//   double maxWidth = 600;
//   bool like = false;
//   return Container(
//     constraints: BoxConstraints(maxWidth: maxWidth),
//     // width: vwidth - 20,
//     // height: vwidth,
//     // decoration: new BoxDecoration(
//     //   borderRadius: new BorderRadius.circular(16.0),
//     //   color: Colors.blue[200],
//     // ),
//     child: Column(
//       children: [
//         Container(
//           constraints: BoxConstraints(maxWidth: maxWidth),
//           // width: vwidth,
//           height: 5,
//           color: Colors.black12,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: gotoprofile,
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: CircleAvatar(
//                         radius: 50.0,
//                         backgroundImage: NetworkImage(Profile),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   constraints: BoxConstraints(maxWidth: maxWidth - 300),
//                   // width: vwidth / 1.3,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         Name,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 16),
//                       ),
//                       Text(
//                         Time,
//                         style: TextStyle(
//                             color: Colors.black45,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 10),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             PopupMenuButton(
//                 icon: const Icon(
//                   Icons.more_vert,
//                   color: Colors.black45,
//                 ),
//                 elevation: 20,
//                 enabled: true,
//                 onSelected: (value) {
//                   if (value == 1) {
//                     print("Edit");
//                   }
//                   if (value == 2) {
//                     print("Delete");
//                   }
//                   if (value == 3) {
//                     print("Report");
//                   }
//                 },
//                 itemBuilder: (context) => [
//                       PopupMenuItem(
//                         child: Text("Edit"),
//                         value: 1,
//                       ),
//                       PopupMenuItem(
//                         child: Text("Delete"),
//                         value: 2,
//                       ),
//                       PopupMenuItem(
//                         child: Text("Report"),
//                         value: 3,
//                       ),
//                     ]),

//             // IconButton(
//             //   onPressed: () {},
//             //   icon: Icon(Icons.more_vert),
//             // )
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             constraints: BoxConstraints(maxWidth: maxWidth),
//             // width: vwidth - 30,
//             decoration: new BoxDecoration(
//               borderRadius: new BorderRadius.circular(16.0),
//               // color: Colors.blue[200],
//               color: Colors.primaries[_random.nextInt(Colors.primaries.length)],
//               // [_random.nextInt(9) * 100],
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: Center(
//                 child: Padding(
//               padding: const EdgeInsets.only(
//                   left: 20, right: 20, top: 70, bottom: 70),
//               child: Text(
//                 Sms,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
//               ),
//             )),
//           ),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         // Container(
//         //   height: 0.2,
//         //   color: Colors.blueGrey,
//         // ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             (like == true)
//                 ? IconButton(
//                     icon: const Icon(Icons.thumb_down),
//                     color: Colors.black45,
//                     tooltip: 'disLike',
//                     onPressed: () {
//                       // setState(() {});
//                       like == false;
//                       // ScaffoldMessenger.of(context).showSnackBar(
//                       //     const SnackBar(content: Text('dis Liked')));
//                     },
//                   )
//                 : IconButton(
//                     icon: const Icon(Icons.thumb_up),
//                     color: Colors.black45,
//                     tooltip: 'Like',
//                     onPressed: () {
//                       like == true;
//                       // ScaffoldMessenger.of(context).showSnackBar(
//                       //     const SnackBar(content: Text('Liked')));
//                     },
//                   ),
//             IconButton(
//               icon: const Icon(Icons.message),
//               color: Colors.black45,
//               tooltip: 'Comment',
//               onPressed: () {
//                 // ScaffoldMessenger.of(context).showSnackBar(
//                 //     const SnackBar(content: Text('This is a snackbar')));
//               },
//             ),
//             PopupMenuButton(
//                 icon: const Icon(
//                   Icons.share,
//                   color: Colors.black45,
//                 ),
//                 elevation: 20,
//                 enabled: true,
//                 onSelected: (value) {
//                   if (value == 1) {
//                     print("Download");
//                   }
//                   if (value == 2) {
//                     print("Share on facebook");
//                   }
//                   if (value == 3) {
//                     print("Share on whatsapp");
//                   }
//                 },
//                 itemBuilder: (context) => [
//                       PopupMenuItem(
//                         child: Text("Download"),
//                         value: 1,
//                       ),
//                       PopupMenuItem(
//                         child: Text("Share on facebook"),
//                         value: 2,
//                       ),
//                       PopupMenuItem(
//                         child: Text("Share on whatsapp"),
//                         value: 3,
//                       ),
//                     ]),
//             // IconButton(
//             //   icon: const Icon(Icons.share),
//             //   color: Colors.black45,
//             //   tooltip: 'Share',
//             //   onPressed: () {
//             //     // ScaffoldMessenger.of(context).showSnackBar(
//             //     //     const SnackBar(content: Text('This is a snackbar')));
//             //   },
//             // ),
//           ],
//         ),
//         // Container(
//         //   height: 0.5,
//         //   color: Colors.blueGrey,
//         // ),
//         // SizedBox(
//         //   height: 10,
//         // ),
//       ],
//     ),
//   );

// }

class Post extends StatefulWidget {
  final String Name;
  final String Email;
  final String PhoneNo;
  final String Profile;
  final String Sms;
  final String Date;
  final String cruntUser;

  const Post({
    Key? key,
    required this.Name,
    required this.Email,
    required this.PhoneNo,
    required this.Profile,
    required this.Sms,
    required this.cruntUser,
    required this.Date,
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

bool like = false;

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    String Name = "";
    String Email = "";
    String PhoneNo = '';
    String Profile = "";
    String Sms = "";
    String Date = "";
    String cruntUser = "";

    setState(() {
      Name = widget.Name;
      Email = widget.Email;
      PhoneNo = widget.PhoneNo;
      Profile = widget.Profile;
      Sms = widget.Sms;
      Date = widget.Date;
      cruntUser = widget.cruntUser;
    });

    gotoprofile() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostProfilePage(
              Name: Name, Email: Email, PhoneNo: PhoneNo, UserProfile: Profile),
        ),
      );
    }

    CollectionReference cruntPost =
        FirebaseFirestore.instance.collection('Posts');
    CollectionReference PostReport =
        FirebaseFirestore.instance.collection('Reports');

    Future<void> deletePost(index) {
      return cruntPost
          .doc(index)
          .delete()
          .then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Your post is deleted')))
              })
          .catchError((error) => print("Failed to delete user: $error"));
    }

    final TextEditingController SMScontroller = TextEditingController();
    String SMS = SMScontroller.text;

    Future<void> updatePost(index) {
      String UpdateSMS = SMScontroller.text;
      return cruntPost
          .doc(index)
          .update({'SMS': UpdateSMS})
          .then((value) => {
                Navigator.of(context).pop(), // dismiss dialog
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Your Post is Updated')))
              })
          .catchError((error) => {
                // print("Failed to update user: $error")
                Navigator.of(context).pop(), // dismiss dialog
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to update Post')))
              });
    }

    updatePop() {
      Widget okButton = ElevatedButton(
        child: Text("Post"),
        onPressed: () {
          updatePost(Name + Date);
        },
        style: ElevatedButton.styleFrom(
            // primary: Colors.purple,
            // padding: EdgeInsets.symmetric(
            //     horizontal: vwidth / 3, vertical: 10),
            textStyle: TextStyle(fontWeight: FontWeight.bold)),
      );
      AlertDialog alert = AlertDialog(
        title: Center(child: Text("Create post")),
        content: SizedBox(
          height: 230,
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 500, maxHeight: 200),
                // width: vwidth - 50,
                // height: 200,
                child: TextFormField(
                  minLines: 1,
                  maxLines: 6,
                  controller: SMScontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "What's on your mind? "),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
              )
            ],
          ),
        ),
        actions: [
          okButton,
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    Future<void> ReportPost() {
      return PostReport
          .doc()
          .set({'Post Auther': Name, 'report Auther': cruntUser, 'SMS':Sms})
          .then((value) => {
            // print("Report submitted"),
             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Report submitted')))})
          .catchError((error) => {
            // print("report submitted Failed: $error")
             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Report submitted Failed')))});
    }

    double maxWidth = 600;
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      // width: vwidth - 20,
      // height: vwidth,
      // decoration: new BoxDecoration(
      //   borderRadius: new BorderRadius.circular(16.0),
      //   color: Colors.blue[200],
      // ),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            // width: vwidth,
            height: 5,
            color: Colors.black12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: gotoprofile,
                    child: Container(
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
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: maxWidth - 300),
                    // width: vwidth / 1.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          Date,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              PopupMenuButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black45,
                  ),
                  elevation: 20,
                  enabled: true,
                  onSelected: (value) {
                    if (value == 1) {
                      if (Name == cruntUser) {
                        updatePop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Your are not allwoed to edit this post')));
                      }
                    }
                    if (value == 2) {
                      if (Name == cruntUser) {
                        deletePost(Name + Date);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Your are not allwoed to Delete this post')));
                      }
                    }
                    if (value == 3) {
                      if (Name == cruntUser) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Your are not allwoed')));
                      } else {
                      ReportPost();
                      }
                    }
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Edit"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Delete"),
                          value: 2,
                        ),
                        PopupMenuItem(
                          child: Text("Report"),
                          value: 3,
                        ),
                      ]),

              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.more_vert),
              // )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              // width: vwidth - 30,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(16.0),
                // color: Colors.blue[200],
                color:
                    Colors.primaries[_random.nextInt(Colors.primaries.length)],
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
                child: Text(
                  Sms,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              )),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          // Container(
          //   height: 0.2,
          //   color: Colors.blueGrey,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up),
                color: Colors.black45,
                tooltip: 'Like',
                onPressed: () {
                  setState(() {
                    like = !like;
                  });
                  print(like);
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('dis Liked')));
                },
              ),

              IconButton(
                icon: const Icon(Icons.message),
                color: Colors.black45,
                tooltip: 'Comment',
                onPressed: () {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('This is a snackbar')));
                },
              ),
              PopupMenuButton(
                  icon: const Icon(
                    Icons.share,
                    color: Colors.black45,
                  ),
                  elevation: 20,
                  enabled: true,
                  onSelected: (value) {
                    if (value == 1) {
                      print("Download");
                    }
                    if (value == 2) {
                      print("Share on facebook");
                    }
                    if (value == 3) {
                      print("Share on whatsapp");
                    }
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Download"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Share on facebook"),
                          value: 2,
                        ),
                        PopupMenuItem(
                          child: Text("Share on whatsapp"),
                          value: 3,
                        ),
                      ]),
              // IconButton(
              //   icon: const Icon(Icons.share),
              //   color: Colors.black45,
              //   tooltip: 'Share',
              //   onPressed: () {
              //     // ScaffoldMessenger.of(context).showSnackBar(
              //     //     const SnackBar(content: Text('This is a snackbar')));
              //   },
              // ),
            ],
          ),
          // Container(
          //   height: 0.5,
          //   color: Colors.blueGrey,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }
}
