import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

var isOrderDb;
var ukuranDb;
var jumlahDb;

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

    var idBro =
        FirebaseDatabase.instance.reference().child('SampleData').push();

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
                  await tableRef.child('data_user').set({
                    'isOrder': true,
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
                  await tableRef.child("data_user").update({
                    'isOrder': true,
                    'Ukuran': "L",
                    'Jumlah': 1,
                  });
                  tableRef.push();
                  print("Update called");
                },
                child: const Text("Update Data")),
            // delete data function
            ElevatedButton(
              onPressed: () {
                _dbRef.once().then((DataSnapshot snapshot) async {
                  await snapshot.value.forEach((key, value) {
                    _dbRef.child("JasAslab").onChildAdded.listen((Event event) {
                      var fullData = event.snapshot.value;
                      isOrderDb = fullData['isOrder'];
                      ukuranDb = fullData['Ukuran'];
                      jumlahDb = fullData['Jumlah'];
                      print(fullData);
                    }, onError: (Object error) {
                      print(error);
                    });
                  });
                });
                print("Read called");
              },
              child: const Text("Read Data"),
            ),
            // remove data function
            ElevatedButton(
              onPressed: () async {
                var tableRef = _dbRef.child("JasAslab");
                await tableRef.child("data_user").remove();
                print("Remove called");
              },
              child: const Text("Delete Data"),
            ),

            Text("Order  : ${isOrderDb}"),
            Text("Ukuran : ${ukuranDb}"),
            Text("Jumlah : ${jumlahDb}"),
          ],
        ),
      ),
    );
  }
}

Future<bool> orderAja() async =>
    FirebaseDatabase.instance.reference().child('JasAslab').once().then(
        (DataSnapshot snapshot) async => await snapshot.value.forEach((value) {
              FirebaseDatabase.instance
                  .reference()
                  .child("data_user")
                  .onChildAdded
                  .listen((Event event) {
                var fullData = event.snapshot.value;
                isOrderDb = fullData['isOrder'];
                ukuranDb = fullData['Ukuran'];
                jumlahDb = fullData['Jumlah'];
              });
            }));

// var isOrder_Db = FirebaseDatabase.instance
//     .reference()
//     .once()
//     .then((DataSnapshot snapshot) async {
//   await snapshot.value.forEach((value) {
//     FirebaseDatabase.instance
//         .reference()
//         .child("JasAslab")
//         .onChildAdded
//         .listen((Event event) {
//       var fullData = event.snapshot.value;
//       isOrder_Db = fullData['isOrder'];
//     });
//   });
// });
