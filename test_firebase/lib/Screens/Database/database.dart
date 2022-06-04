// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:test_firebase/Screens/Database/data_test.dart';

// class TestAja extends StatefulWidget {
//   const TestAja({Key? key}) : super(key: key);

//   @override
//   State<TestAja> createState() => _TestAjaState();
// }

// class _TestAjaState extends State<TestAja> {
//   final databaseRef = FirebaseDatabase.instance.reference().child("JasAslab");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child:
//             FirebaseAnimatedList(
//               query: databaseRef, 
//               itemBuilder: (BuildContext context, DataSnapshot snapshot)),
//       ),
//     );
//   }
// }

// class DatabaseApp {
//   String ukuran;

//   DatabaseApp(this.ukuran);

//   DatabaseApp.fromJson(Map<dynamic, dynamic> json)
//       : ukuran = json['Ukuran'] as String;

//   Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
//         'Ukuran': ukuran,
//       };
//   var dsads = FirebaseDatabase.instance
//       .reference()
//       .once()
//       .then((DataSnapshot snapshot) async {
//     snapshot.value.forEach((key, value) async {
//       FirebaseDatabase.instance
//           .reference()
//           .child("JasAslab")
//           .onChildAdded
//           .listen((Event event) {
//         var fullData = event.snapshot.value;
//         nim_Db = fullData['NIM'];
//         ukuran_Db = (snapshot.value['Ukuran']);
//         // print("Nama : $nama_Db");
//         print("Data : $fullData");
//       }, onError: (Object error) {
//         print(error);
//       });
//     });
//   });
// }
