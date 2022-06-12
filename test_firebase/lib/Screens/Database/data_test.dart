import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:test_firebase/Screens/Database/storage_service.dart';

// ignore: prefer_typing_uninitialized_variables
var isOrderDb;
// ignore: prefer_typing_uninitialized_variables
var ukuranDb;
// ignore: prefer_typing_uninitialized_variables
var jumlahDb;

class MyDatabase extends StatefulWidget {
  const MyDatabase({Key? key}) : super(key: key);

  @override
  State<MyDatabase> createState() => _MyDatabase();
}

class _MyDatabase extends State<MyDatabase> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    final dbRef = FirebaseDatabase.instance.reference().child('JasAslab');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Debug'),
      ),
      backgroundColor: Colors.white,
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyDatabase()));
                  var tableRef = dbRef.child("JasAslab");
                  await tableRef.child('data_user').set({
                    'isOrder': true,
                    'Ukuran': "S",
                    'Jumlah': 1,
                  });

                  await dbRef.once().then((DataSnapshot snapshot) {
                    snapshot.value.forEach((key, value) {
                      dbRef.child("JasAslab").onChildAdded.listen(
                          (Event event) {
                        var fullData = event.snapshot.value;
                        isOrderDb = fullData['isOrder'];
                        ukuranDb = fullData['Ukuran'];
                        jumlahDb = fullData['Jumlah'];
                        if (kDebugMode) {
                          print(fullData);
                        }
                      }, onError: (Object error) {
                        if (kDebugMode) {
                          print(error);
                        }
                      });
                    });
                  });

                  tableRef.push();
                  if (kDebugMode) {
                    print("Push called");
                  }
                },
                child: const Text("Save Data")),
            // update data function
            ElevatedButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyDatabase()));
                  var tableRef = dbRef.child("JasAslab");
                  await tableRef.child("data_user").update({
                    'isOrder': true,
                    'Ukuran': "XL",
                    'Jumlah': 1,
                  });

                  await dbRef.once().then((DataSnapshot snapshot) {
                    snapshot.value.forEach((key, value) {
                      dbRef.child("JasAslab").onChildAdded.listen(
                          (Event event) {
                        var fullData = event.snapshot.value;
                        isOrderDb = fullData['isOrder'];
                        ukuranDb = fullData['Ukuran'];
                        jumlahDb = fullData['Jumlah'];
                        if (kDebugMode) {
                          print(fullData);
                        }
                      }, onError: (Object error) {
                        if (kDebugMode) {
                          print(error);
                        }
                      });
                    });
                  });

                  tableRef.push();
                  if (kDebugMode) {
                    print("Update called");
                  }
                },
                child: const Text("Update Data")),
            // display data function
            ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyDatabase()));
                await dbRef.once().then((DataSnapshot snapshot) {
                  snapshot.value.forEach((key, value) {
                    dbRef.child("JasAslab").onChildAdded.listen((Event event) {
                      var fullData = event.snapshot.value;
                      isOrderDb = fullData['isOrder'];
                      ukuranDb = fullData['Ukuran'];
                      jumlahDb = fullData['Jumlah'];
                      if (kDebugMode) {
                        print(fullData);
                      }
                    }, onError: (Object error) {
                      if (kDebugMode) {
                        print(error);
                      }
                    });
                  });
                });
                if (kDebugMode) {
                  print("Read called");
                }
              },
              child: const Text("Read Data"),
            ),
            // remove data function
            ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyDatabase()));

                isOrderDb = false;
                ukuranDb = "";
                jumlahDb = 0;

                var tableRef = dbRef.child("JasAslab");
                await tableRef.child("data_user").remove();
                if (kDebugMode) {
                  print("Remove called");
                }
              },
              child: const Text("Delete Data"),
            ),
            // debug data from firebase
            Text("Order  : $isOrderDb"),
            Text("Ukuran : $ukuranDb"),
            Text("Jumlah : $jumlahDb"),
            // upload images
            ElevatedButton(
                onPressed: (() async {
                  final result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpg'],
                  );

                  if (result == null) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No file selected'),
                      ),
                    );
                    return null;
                  }

                  final path = result.files.single.path!;
                  final fileName = result.files.single.name;

                  storage
                      .uploadFile(path, fileName)
                      .then((value) => print("Done"));
                }),
                child: const Text("Upload File")),
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
