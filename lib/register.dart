import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pk_book/Navigation.dart';
import 'package:pk_book/login.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernamecontroller = TextEditingController();
    final TextEditingController useremailcontroller = TextEditingController();
    final TextEditingController phonenocontroller = TextEditingController();
    final TextEditingController otpcontroller = TextEditingController();
    final TextEditingController userpasswordcontroller =
        TextEditingController();
    String UserProfile =
        "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=";

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
    final String username = usernamecontroller.text;
    final String useremail = useremailcontroller.text;
    final String userOTP = otpcontroller.text;
    final String PhoneNo = phonenocontroller.text;
    final String userpassword = userpasswordcontroller.text;
    void register() async {
      try {
        var res = EmailAuth.validate(
            receiverMail: useremailcontroller.text,
            userOTP: otpcontroller.text);
        if (res) {
          print("OTP Verified and Log in.....");
          final UserCredential user = await auth.createUserWithEmailAndPassword(
              email: useremail, password: userpassword);
          await firestore.collection("users").doc(user.user.uid).set({
            "username": username,
            "email": useremail,
            "PhoneNo": PhoneNo,
            "password": userpassword,
            "UserProfile": UserProfile,
            "UID": user.user.uid
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                  Name: username,
                  Email: useremail,
                  PhoneNo: PhoneNo,
                  UserProfile: UserProfile),
            ),
          );
        } else {
          print("Invalid OTP");
        }
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

    void sentOTP() async {
      EmailAuth.sessionName = "Test Session";
      var res = await EmailAuth.sendOtp(receiverMail: useremailcontroller.text);
      if (res) {
        print("OTP Sent");
      } else {
        print("We could not sent the OTP");
      }
    }

    void verifyOTP() {
      var res = EmailAuth.validate(
          receiverMail: useremailcontroller.text, userOTP: otpcontroller.text);
      if (res) {
        print("OTP Verified");
      } else {
        print("Invalid OTP");
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/signup',
      title: 'LinkedUp',
      home: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text('Welcome to Arya Solutions'),
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 68.0, left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    decoration: new BoxDecoration(
                        color: Colors.black12,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                        )),
                    constraints: BoxConstraints(maxWidth: 600),
                    // width: 360,
                    // height: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 15, right: 15),
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Text(
                                'Welcome to LinkedUp',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 30),
                              TextField(
                                controller: usernamecontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Username",
                                  labelText: "User Name",
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                controller: useremailcontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Email",
                                    labelText: "Email",
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: TextButton(
                                        child: Text("Sent OTP"),
                                        onPressed: () => sentOTP(),
                                      ),
                                    )),
                              ),

                              SizedBox(height: 15),
                              TextField(
                                controller: otpcontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter OTP",
                                  labelText: "Enter OTP",
                                  // suffixIcon: TextButton(
                                  //   child: Text("Verify OTP"),
                                  //   onPressed: () => verifyOTP(),
                                  // ),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                controller: phonenocontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Phone Number",
                                    labelText: "Phone Number"),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                controller: userpasswordcontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Password"),
                              ),
                              FlutterPasswordStrength(
                                  password: userpassword,
                                  strengthCallback: (strength) {
                                    debugPrint(strength.toString());
                                  }),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     TextButton(
                              //         onPressed: () {},
                              //         child: Text(
                              //           'Forget Password',
                              //           style: TextStyle(fontSize: 10.0),
                              //         )),
                              //   ],
                              // ),
                              SizedBox(height: 10),
                              FlatButton(
                                onPressed: register,
                                child: Text(
                                  'Registration',
                                  // style: TextStyle(fontSize: 10.0),
                                ),
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                              ),
                              // SignInButton(
                              //   Buttons.Google,
                              //   onPressed: () {
                              //     signInWithGoogle(context);
                              //   },
                              // ),
                              // SignInButton(
                              //   Buttons.Facebook,
                              //   onPressed: () {
                              //     facebook_auth(context);
                              //   },
                              // ),
                              // SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Login(),
                                          ),
                                        );
                                        // Navigator.pushNamed(context, '/');
                                      },
                                      child: Text(
                                        "I have an account? Login",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(height: 50),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
