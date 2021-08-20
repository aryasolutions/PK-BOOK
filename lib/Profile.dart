import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:pk_book/Navigation.dart';
import 'package:pk_book/PKBook.dart';
import 'package:pk_book/login.dart';

class UserProfilePage extends StatefulWidget {
  final String Name;
  final String Email;
  final String PhoneNo;
  final String UserProfile;
  const UserProfilePage({
    Key? key,
    required this.Name,
    required this.Email,
    required this.PhoneNo,
    required this.UserProfile,
  }) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Map data = {};
  String Name = "Null";
  String Email = "Null";
  String photoUrl =
      "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1214428300?k=6&m=1214428300&s=170667a&w=0&h=hMQs-822xLWFz66z3Xfd8vPog333rNFHU6Q_kc9Sues=";
  String PhoneNo = "03XX-XXXXXXX";
  String About = "I am Muslim";

  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context)!.settings.arguments as Map;
    // print('========================+=UserProfilePage=+============================');
    // print(data);
    // print('======================================================');
    // Add item to a Map in Dart/Flutter
    // var threeValue = data.putIfAbsent(3, () => 'THREE');
    // print('Length =====> ${data.length}'); // 2

    // print('isEmpty =====> ${data.isEmpty}'); // false
    // print('isNotEmpty =====> ${data.isNotEmpty}'); // true

    // print('keys =====> ${data.keys}'); // (1, 2)
    // print('values =====> ${data.values}'); // (one, two)

    // print('1st Index =====> ${data['Name']}'); // two
    // print('2nd Index =====> ${data['Email']}');
    // setState(() {
    //   if (data['Name'] != null) {
    //     Name = data['Name'];
    //   }
    //   if (data['Email'] != null) {
    //     Email = data['Email'];
    //   }
    //   if (data['PhoneNo'] != null) {
    //     PhoneNo = data['PhoneNo'];
    //   }
    //   if (data['Profile'] != null) {
    //     photoUrl = data['Profile'];
    //     // print("===================================$photoUrl");
    //   }
    // });
    Log_Out() {
      // setState(() {
      //   data.remove('Name');
      //   data.remove('Email');
      //   data.remove('Profile');
      //   Name = "";
      //   Email = "";
      // });
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Login(),
      //   ),
      // );
      // Widget okButton = TextButton(
      //   child: Text("OK"),
      //   onPressed: () {
      //     Navigator.of(context).pop(); // dismiss dialog
      //   },
      // );
      // AlertDialog alert = AlertDialog(
      //   title: Center(child: Text("Logout Successful")),
      //   content: Text("You have successful loggedout"),
      //   actions: [
      //     okButton,
      //   ],
      // );
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return alert;
      //   },
      // );
    }
    double maxWidth = 600;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth - 100),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
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
                  icon: Icon(
                    Icons.arrow_back,
                  )),
              // title: Text('Logged In with ${data['provider']}'),
              title: Text('Profile'),
              // actions: [
              //   IconButton(
              //       onPressed: Log_Out,
              //       icon: Icon(
              //         Icons.logout,
              //         size: 35,
              //         color: Colors.red,
              //       ))
              // ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        // width: MediaQuery.of(context).size.width / 12,
                        // height: MediaQuery.of(context).size.width / 12,
                        //  child: Image.network('https://picsum.photos/250?image=9'),
                        // color: Colors.black38,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${widget.UserProfile}"),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Center(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // // // // // // // // // // // // // // // // // // // Name // // // // // // // // // // // // // // // // // //
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: maxWidth),
                                      // width: MediaQuery.of(context).size.width /1.4,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black38,
                                              ),
                                            ),
                                            Text(
                                              widget.Name,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: IconButton(
                                        alignment: Alignment.bottomRight,
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      Text("Enter Your Name"),
                                                  content: TextField(
                                                    decoration: InputDecoration(
                                                        // border: OutlineInputBorder(),
                                                        hintText: Name),
                                                    onChanged: (value) {
                                                      Name = value;
                                                    },
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                        },
                                                        child: Center(
                                                            child:
                                                                Text("Update")))
                                                  ],
                                                );
                                              });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.black38,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Container(
                                      constraints:
                                          BoxConstraints(maxWidth: maxWidth),
                                      // width: MediaQuery.of(context).size.width -20,
                                      height: 1,
                                      color: Colors.black12),
                                ),
                                // // // // // // // // // // // // // // // // // // // Email // // // // // // // // // // // // // // // // // //

                                Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: maxWidth),
                                      // width: MediaQuery.of(context).size.width /  1.4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Email",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black38,
                                              ),
                                            ),
                                            Text(
                                              widget.Email,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      Text("Enter Your Email"),
                                                  content: TextField(
                                                    decoration: InputDecoration(
                                                        // border: OutlineInputBorder(),
                                                        hintText:
                                                            "XXXXXXXXX@gmail.com"),
                                                    onChanged: (value) {
                                                      Email = value;
                                                    },
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                        },
                                                        child: Center(
                                                            child:
                                                                Text("Update")))
                                                  ],
                                                );
                                              });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.black38,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Container(
                                      constraints:
                                          BoxConstraints(maxWidth: maxWidth),
                                      // width: MediaQuery.of(context).size.width -  20,
                                      height: 1,
                                      color: Colors.black12),
                                ),
                                // // // // // // // // // // // // // // // // // // // Phone Number // // // // // // // // // // // // // // // // // //
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: maxWidth),
                                      // width: MediaQuery.of(context).size.width /   1.4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Phone Number",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black38,
                                              ),
                                            ),
                                            Text(
                                              widget.PhoneNo,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      Text("Enter Your Number"),
                                                  content: TextField(
                                                    decoration: InputDecoration(
                                                        // border: OutlineInputBorder(),
                                                        hintText:
                                                            "03XX-XXXXXXX"),
                                                    onChanged: (value) {
                                                      PhoneNo = value;
                                                    },
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                        },
                                                        child: Center(
                                                            child:
                                                                Text("Update")))
                                                  ],
                                                );
                                              });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.black38,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Container(
                                      constraints:
                                          BoxConstraints(maxWidth: maxWidth),
                                      // width: MediaQuery.of(context).size.width -20,
                                      height: 1,
                                      color: Colors.black12),
                                ),
                                // // // // // // // // // // // // // // // // // // // About // // // // // // // // // // // // // // // // // //
                                Row(
                                  children: [
                                    Icon(
                                      Icons.info,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: maxWidth),
                                      // width: MediaQuery.of(context).size.width /1.4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "About",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black38,
                                              ),
                                            ),
                                            Text(
                                              About,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      Text("Enter Your Number"),
                                                  content: TextField(
                                                    decoration: InputDecoration(
                                                        // border: OutlineInputBorder(),
                                                        hintText: About),
                                                    onChanged: (value) {
                                                      About = value;
                                                    },
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                        },
                                                        child: Center(
                                                            child:
                                                                Text("Update")))
                                                  ],
                                                );
                                              });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.black38,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Container(
                                      constraints:
                                          BoxConstraints(maxWidth: maxWidth),
                                      // width: MediaQuery.of(context).size.width -20,
                                      height: 1,
                                      color: Colors.black12),
                                ),
                                // // // // // // // // // // // // // // // // // // //  // // // // // // // // // // // // // // // // // //
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //  Text('Logged In with ${data['provider']}',
                    //  style: TextStyle(),),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Text(
                          'Logged In with Email',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      //   body: Padding(
      //     padding: const EdgeInsets.only(top: 200),
      //     child: Center(
      //       child: Column(
      //         children: [
      //           // Text(
      //           //   "Profile",
      //           //   style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
      //           // ),
      //           SizedBox(height: 50),
      //           Text(
      //             Name,
      //             style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(height: 50),
      //           Text(
      //             Email,
      //             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(height: 50),
      //           FlatButton(
      //             child: Text(
      //               'Log Out',
      //             ),
      //             color: Colors.blueAccent,
      //             textColor: Colors.white,
      //             onPressed: () {
      //               setState(() {
      //                 data = {};
      //                 Name = "";
      //                 Email = "";
      //               });
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => Login(),
      //                 ),
      //               );
      //               // Navigator.pushNamed(context, '/');
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
