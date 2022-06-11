import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    final _dbRef = FirebaseDatabase.instance.reference().child('JasAslab');
    _MyDatabase() {
      setState(() {
        _dbRef.once().then((DataSnapshot snap) {
          var keys = snap.value.keys;
          var data = snap.value;
          isOrderDb = data['isOrder'];
          ukuranDb = data['ukuran'];
          jumlahDb = data['jumlah'];
        });
      });
    }

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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DataTest()));
                  var tableRef = _dbRef.child("JasAslab");
                  await tableRef.child('data_user').set({
                    'isOrder': true,
                    'Ukuran': "S",
                    'Jumlah': 1,
                  });

                  await _dbRef.once().then((DataSnapshot snapshot) {
                    snapshot.value.forEach((key, value) {
                      _dbRef.child("JasAslab").onChildAdded.listen(
                          (Event event) {
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

                  tableRef.push();
                  print("Push called");
                },
                child: const Text("Save Data")),
            // update data function
            ElevatedButton(
                onPressed: () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DataTest()));
                  var tableRef = _dbRef.child("JasAslab");
                  await tableRef.child("data_user").update({
                    'isOrder': true,
                    'Ukuran': "XL",
                    'Jumlah': 1,
                  });

                  await _dbRef.once().then((DataSnapshot snapshot) {
                    snapshot.value.forEach((key, value) {
                      _dbRef.child("JasAslab").onChildAdded.listen(
                          (Event event) {
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

                  tableRef.push();
                  print("Update called");
                },
                child: const Text("Update Data")),
            // display data function
            ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DataTest()));
                await _dbRef.once().then((DataSnapshot snapshot) {
                  snapshot.value.forEach((key, value) {
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DataTest()));

                isOrderDb = false;
                ukuranDb = "";
                jumlahDb = 0;

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

Future<void> orderAja() =>
    FirebaseDatabase.instance.reference().child('JasAslab').once().then(
          (DataSnapshot snapshot) => snapshot.value.forEach(
            (value) {
              FirebaseDatabase.instance
                  .reference()
                  .child("data_user")
                  .onChildAdded
                  .listen(
                (Event event) {
                  var fullData = event.snapshot.value;
                  isOrderDb = fullData['isOrder'];
                },
              );
            },
          ),
        );
