// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:test_firebase/Screens/BuktiTransfer/bukti_body.dart';
// import 'package:test_firebase/Screens/BuktiTransfer/bukti_screen.dart';
// import 'package:test_firebase/constants.dart';
// import 'storage_service.dart';
// import 'package:firebase_database/firebase_database.dart';

// // ignore: prefer_typing_uninitialized_variables
// var isOrderDb;
// // ignore: prefer_typing_uninitialized_variables
// var ukuranDb;
// // ignore: prefer_typing_uninitialized_variables
// var jumlahDb;
// // ignore: prefer_typing_uninitialized_variables
// var filePath;

// class MyDatabase extends StatefulWidget {
//   const MyDatabase({Key? key}) : super(key: key);

//   @override
//   State<MyDatabase> createState() => _MyDatabase();
// }

// class _MyDatabase extends State<MyDatabase> {
//   @override
//   Widget build(BuildContext context) {
//     final Storage storage = Storage();
//     final dbRef = FirebaseDatabase.instance.reference();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Database Debug'),
//       ),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Flutter Firebase Example',
//               style: TextStyle(fontSize: 24),
//             ),
//             // save data function
//             ElevatedButton(
//                 onPressed: () async {
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const MyDatabase()));
//                   var tableRef = dbRef.child("JasAslab");
//                   await tableRef.child('data_user').set({
//                     'isOrder': true,
//                     'Ukuran': "S",
//                     'Jumlah': 1,
//                   });

//                   await dbRef.once().then((DataSnapshot snapshot) {
//                     snapshot.value.forEach((key, value) {
//                       dbRef.child("JasAslab").onChildAdded.listen(
//                           (Event event) {
//                         var fullData = event.snapshot.value;
//                         isOrderDb = fullData['isOrder'];
//                         ukuranDb = fullData['Ukuran'];
//                         jumlahDb = fullData['Jumlah'];
//                         if (kDebugMode) {
//                           print(fullData);
//                         }
//                       }, onError: (Object error) {
//                         if (kDebugMode) {
//                           print(error);
//                         }
//                       });
//                     });
//                   });

//                   tableRef.push();
//                   if (kDebugMode) {
//                     print("Push called");
//                   }
//                 },
//                 child: const Text("Save Data")),
//             // update data function
//             ElevatedButton(
//                 onPressed: () async {
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const MyDatabase()));
//                   var tableRef = dbRef.child("JasAslab");
//                   await tableRef.child("data_user").update({
//                     'isOrder': true,
//                     'Ukuran': "XL",
//                     'Jumlah': 1,
//                   });

//                   await dbRef.once().then((DataSnapshot snapshot) {
//                     snapshot.value.forEach((key, value) {
//                       dbRef.child("JasAslab").onChildAdded.listen(
//                           (Event event) {
//                         var fullData = event.snapshot.value;
//                         isOrderDb = fullData['isOrder'];
//                         ukuranDb = fullData['Ukuran'];
//                         jumlahDb = fullData['Jumlah'];
//                         if (kDebugMode) {
//                           print(fullData);
//                         }
//                       }, onError: (Object error) {
//                         if (kDebugMode) {
//                           print(error);
//                         }
//                       });
//                     });
//                   });

//                   tableRef.push();
//                   if (kDebugMode) {
//                     print("Update called");
//                   }
//                 },
//                 child: const Text("Update Data")),
//             // display data function
//             ElevatedButton(
//               onPressed: () async {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const MyDatabase()));

//                 try {
//                   await dbRef.once().then((DataSnapshot snapshot) {
//                     // masih mencari else untuk data null nya
//                     snapshot.value.map((key, value) {
//                       dbRef.child("JasAslab").onChildAdded.listen(
//                           (Event event) {
//                         var fullData = event.snapshot.value;
//                         isOrderDb = fullData['isOrder'];
//                         ukuranDb = fullData['Ukuran'];
//                         jumlahDb = fullData['Jumlah'];
//                         if (kDebugMode) {
//                           print(fullData);
//                         }
//                       }, onError: (Object error) {
//                         if (kDebugMode) {
//                           print(error);
//                         }
//                       });
//                     });
//                   });
//                 } on Exception catch (e) {
//                   print("Error : $e");
//                 }
//                 if (kDebugMode) {
//                   print("Read called");
//                 }
//               },
//               child: const Text("Read Data"),
//             ),
//             // remove data function
//             ElevatedButton(
//               onPressed: () async {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const MyDatabase()));

//                 isOrderDb = false;
//                 ukuranDb = "";
//                 jumlahDb = 0;

//                 var tableRef = dbRef.child("JasAslab");
//                 await tableRef.child("data_user").remove();
//                 if (kDebugMode) {
//                   print("Remove called");
//                 }
//               },
//               child: const Text("Delete Data"),
//             ),
//             // debug data from firebase
//             Text("Order  : $isOrderDb"),
//             Text("Ukuran : $ukuranDb"),
//             Text("Jumlah : $jumlahDb"),
//             // upload images
//             ElevatedButton(
//               onPressed: (() async {
//                 final result = await FilePicker.platform.pickFiles(
//                   allowMultiple: false,
//                   type: FileType.custom,
//                   allowedExtensions: ['png', 'jpg'],
//                 );

//                 if (result == null) {
//                   // ignore: use_build_context_synchronously
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('No file selected'),
//                     ),
//                   );
//                   return null;
//                 }

//                 final path = result.files.single.path!;
//                 final fileName = result.files.single.name;

//                 filePath = fileName;

//                 storage
//                     .uploadFile(path, fileName)
//                     .then((value) => print("Done"));
//               }),
//               child: const Text('Upload Image'),
//             ),
//             FutureBuilder(
//                 future: storage.listFiles(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<firebase_storage.ListResult> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done &&
//                       snapshot.hasData) {
//                     return Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       height: 50,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: snapshot.data!.items.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 primary: backgroundcolor,
//                               ),
//                               child: Text(
//                                   "Image path : ${snapshot.data!.items[index].name}"),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }
//                   if (snapshot.connectionState == ConnectionState.waiting ||
//                       !snapshot.hasData) {
//                     return const CircularProgressIndicator();
//                   }
//                   return Container();
//                 }),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const BuktiTF()));
//               },
//               child: const Text("See the images"),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const BuktiBody()));
//                 },
//                 child: const Text("Upload Bukti TF")),
//           ],
//         ),
//       ),
//     );
//   }
// }
