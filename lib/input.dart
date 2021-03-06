import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class input extends StatefulWidget {
  // ignore: non_constant_identifier_names
  // const input({Key? key, required String Name, String? Email, String? PhoneNo}) : super(key: key);
  final String Name;
  final String Email;
  final String PhoneNo;
  final String UserProfile;
  input({
    required this.Name,
    required this.Email,
    required this.PhoneNo,
    required this.UserProfile,
  });
  // PKBook({String, String? Email, String? Name, String? PhoneNo});

  @override
  _inputState createState() => _inputState();
}

class _inputState extends State<input> {
  int largeindex = 0;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    data() async {
      await firestore
          .collection("Posts")
          .get()
          .then((snapshot) => snapshot.docs.forEach((element) {
                var fdata = element.data();
                if (fdata["index"] >= largeindex) {
                  setState(() {
                    largeindex = fdata["index"];
                    largeindex++;
                  });
                }
              }));
      print(
          "++++++++++++++++++Firebase largeindex $largeindex+++++++++++++++++++++");
    }

    // print("================Input widget=================>");
    // print(widget.Name);
    // print(widget.Email);
    // print(widget.PhoneNo);
    // print(widget.UserProfile);
    String UserName = "User Name";
    String UserEmail = "Abc@gmail.com";
    String PhoneNo = "03XX-XXXXXXXX";
    String UserProfile = "03XX-XXXXXXXX";
    setState(() {
      UserName = widget.Name;
      UserEmail = widget.Email;
      PhoneNo = widget.PhoneNo;
      UserProfile = widget.UserProfile;
    });
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    final TextEditingController SMScontroller = TextEditingController();

    void UploadPost() async {
      // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
      String SMS = SMScontroller.text;
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);
        print(formattedDate);
        await firestore.collection("Posts").doc(UserName + formattedDate).set({
          "username": UserName,
          "email": UserEmail,
          "PhoneNo": PhoneNo,
          "SMS": SMS,
          "Date": formattedDate,
          "index": largeindex,
          "UserProfile": UserProfile,
        });
        setState(() {
          SMS = '';
        });
        // Navigator.pushReplacementNamed(context, '/Home', arguments: {
        //   'Name': username,
        //   'Email': useremail,
        //   'PhoneNo': PhoneNo
        // });
        Navigator.of(context).pop(); // dismiss dialog

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Your post is Uploaded')));
      } catch (e) {
        print("Error ==============>$e");
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(); // dismiss dialog
          },
        );
        AlertDialog alert = AlertDialog(
          title: Center(child: Text("Error")),
          content: Text("$e"),
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
      // print([username, useremail, userpassword]);
    }

    double maxWidth = 600;
    // double posbarwidth = 0;
    // if ((vwidth / 1.35) == 550) {
    //   posbarwidth = vwidth / 1.35;
    //   print(posbarwidth);
    // }
    return Center(
      child: Container(
        constraints: BoxConstraints(minWidth: 300, maxWidth: maxWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // constraints: BoxConstraints(minWidth: 300,maxWidth: maxWidth),
              width: ((vwidth / 1.35) < 450) ? vwidth / 1.35 : 450,
              // width: vwidth / 1.29,
              // height: 12,
              child: TextButton(
                  onPressed: () {
                    data();
                    Widget okButton = ElevatedButton(
                      child: Text("Post"),
                      onPressed: UploadPost,
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
                              constraints: BoxConstraints(maxWidth: maxWidth-100,maxHeight: 200),
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
                              // children: <Widget>[okButton],
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
                  },
                  child: Text(
                    "What's on your mind? ",
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  )),
            ),
            Container(
              width: 0.5,
              height: 40,
              color: Colors.black38,
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.image,
                    color: Colors.black38,
                  ),
                  tooltip: 'Photo',
                  onPressed: () {},
                ),
                Text(
                  "Photo",
                  style: TextStyle(fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
