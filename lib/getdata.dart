// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:pk_book/PKBook.dart';

class GetPostData extends StatefulWidget {
  final String username;
  GetPostData({required this.username});

  @override
  _GetPostDataState createState() => _GetPostDataState();
}

class _GetPostDataState extends State<GetPostData> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Posts')
      .orderBy('index', descending: true)
      // .where('index', isGreaterThan: '3')
      // .limitToLast(2)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    String PhoneNo = "Show only Owner";
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingFadingLine.circle(),
            );
          }
          var vwidth = MediaQuery.of(context).size.width;
          var vhight = MediaQuery.of(context).size.height;
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Container(
                child: Column(
                  children: [
                    Post(
                      Name: data['username'],
                      Date: data['Date'],
                      PhoneNo: data['PhoneNo'],
                      Profile: data['UserProfile'],
                      Email: data['email'],
                      Sms: data['SMS'],
                    )
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
// class Getdata extends StatefulWidget {
//   const Getdata({Key? key}) : super(key: key);

//   @override
//   _GetdataState createState() => _GetdataState();
// }

// class _GetdataState extends State<Getdata> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text("Get Data from fire store"),
//       ),
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
//           builder: (context, snapshots) {
//             if (!snapshots.hasData)
//               return Text("Loading data..... please wait");
//             return Column(
//               children:[
//                 snapshots.data.documents[0]['email'],
//                 snapshots.data.documents[0]['username'],
//               ],
//             );
//           }),
//     );
//   }
// }

// // class Getdata {
// //   final CollectionReference postList = FirebaseFirestore.instance.collection('Posts');
// // }

// // // Future Getdata() async {
// // //   try {
// // //     await 
// // //   } catch (e) {
// // //     print(e.toString());
// // //     return null;
// // //   }
// // // }
