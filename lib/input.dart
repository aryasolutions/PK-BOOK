import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class input extends StatefulWidget {
  const input({Key? key}) : super(key: key);

  @override
  _inputState createState() => _inputState();
}

class _inputState extends State<input> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    String UserName = "User Name";
    String UserEmail = "Abc@gmail.com";
    String PhoneNo = "03XX-XXXXXXXX";
    final TextEditingController SMScontroller = TextEditingController();

    void UploadPost() async {
      // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
      final String SMS = SMScontroller.text;
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        DateTime now  = DateTime.now();
        String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(now);
        print(formattedDate);
        await firestore.collection("Posts").doc(UserName+formattedDate).set({
          "username": UserName,
          "email": UserEmail,
          "PhoneNo": PhoneNo,
          "SMS": SMS
        });
        // Navigator.pushReplacementNamed(context, '/Home', arguments: {
        //   'Name': username,
        //   'Email': useremail,
        //   'PhoneNo': PhoneNo
        // });
        Navigator.of(context).pop(); // dismiss dialog
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

    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=",
              ),
            ),
          ),
        ),
        Container(
          width: vwidth / 1.29,
          // height: 12,
          child: TextButton(
              onPressed: () {
                Widget okButton = ElevatedButton(
                  child: Text("Post"),
                  onPressed: UploadPost,
                  style: ElevatedButton.styleFrom(
                      // primary: Colors.purple,
                      padding: EdgeInsets.symmetric(
                          horizontal: vwidth / 3, vertical: 10),
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                );
                AlertDialog alert = AlertDialog(
                  title: Center(child: Text("Create post")),
                  content: Column(
                    children: [
                      Container(
                        width: vwidth - 50,
                        height: 300,
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 8,
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
                        children: <Widget>[okButton],
                      )
                    ],
                  ),
                  // actions: [
                  //   okButton,
                  // ],
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
    );
  }
}
