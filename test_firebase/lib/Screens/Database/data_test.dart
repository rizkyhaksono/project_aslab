import 'dart:async';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_firebase/Screens/Login/login_page_state.dart';

var nim_Db;
var nama_Db;
var ukuran_Db;

class DataTest extends StatelessWidget {
  const DataTest({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Database Main',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyDatabase(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyDatabase extends StatefulWidget {
  const MyDatabase({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyDatabase> createState() => _MyDatabase();
}

class _MyDatabase extends State<MyDatabase> {
  @override
  Widget build(BuildContext context) {
    final _dbRef = FirebaseDatabase.instance.reference();

    var id_bro =
        FirebaseDatabase.instance.reference().child('SampleData').push().key;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Flutter Firebase Example',
              style: TextStyle(fontSize: 24),
            ),
            // save data function
            ElevatedButton(
                onPressed: () async {
                  var tableRef = _dbRef.child("JasAslab");
                  await tableRef.child(id_bro).set({
                    'NIM': nimUser,
                    'Name': fullNameUser,
                    'Email': emailUser,
                    'Ukuran': "S",
                    'Jumlah': 1,
                  });
                  tableRef.push();
                  print("Push called");
                },
                child: const Text("Save Data")),
            // update data function
            ElevatedButton(
                onPressed: () async {
                  var tableRef = _dbRef.child("JasAslab");
                  await tableRef.child(id_bro).update({
                    'NIM': nimUser,
                    'Name': fullNameUser,
                    'Email': emailUser,
                    'Ukuran': "M",
                    'Jumlah': 1,
                  });
                  tableRef.push();
                  print("Update called");
                },
                child: const Text("Update Data")),
            // delete data function
            ElevatedButton(
              onPressed: () async {
                await _dbRef.once().then((DataSnapshot snapshot) async {
                  snapshot.value.forEach((key, value) async {
                    await _dbRef.child("JasAslab").onChildAdded.listen(
                        (Event event) {
                      var fullData = event.snapshot.value;
                      nim_Db = fullData['NIM'];
                      ukuran_Db = fullData['Ukuran'];
                      print(ukuran_Db);
                    }, onError: (Object error) {
                      print(error);
                    });
                  });
                });
                print("Read called");
              },
              child: const Text("Read Data"),
            ),
            Text("Ukuran : $ukuran_Db"),
            // remove data function
            ElevatedButton(
              onPressed: () async {
                var tableRef = _dbRef.child("SampleData");
                await tableRef.child(id_bro).remove();
                print("Remove called");
              },
              child: const Text("Delete Data"),
            ),
          ],
        ),
      ),
    );
  }
}
