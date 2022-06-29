import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/BuktiTransfer/bukti_screen.dart';
import 'package:test_firebase/Screens/Database/data_test.dart';
import 'package:test_firebase/Screens/Database/storage_service.dart';
import 'package:test_firebase/constants.dart';

var filePathBukti;
var nameImage;
var totalImage;

class BuktiBody extends StatefulWidget {
  const BuktiBody({Key? key}) : super(key: key);

  @override
  State<BuktiBody> createState() => _BuktiBodyState();
}

class _BuktiBodyState extends State<BuktiBody> {
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        shadowColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(left: 55),
          child: Text(
            "Bukti Transfer",
            style: TextStyle(
              fontFamily: "Poppin",
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              color: backgroundcolor,
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 75, left: 55),
              child: Text(
                "Upload Bukti Transfer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Poppin",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: IconButton(
              icon: const Icon(
                Icons.add_a_photo,
                size: 50,
              ),
              onPressed: (() async {
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg'],
                );

                if (result == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No file selected'),
                    ),
                  );
                  return null;
                }

                final path = result.files.single.path!;
                final fileName = result.files.single.name;

                filePathBukti = fileName;

                storage
                    .uploadFile(path, fileName)
                    .then((value) => print("Sudah terupload"));

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyDatabase()));
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // debug test
                FutureBuilder(
                    future: storage.listFiles(),
                    builder: (BuildContext context,
                        AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: (snapshot.data!.items.length > 1)
                                ? snapshot.data!.items.length - 1
                                : snapshot.data!.items.length,
                            itemBuilder: (BuildContext context, int index) {
                              // wrap data from firebase to local
                              nameImage = snapshot.data!.items[index].name;
                              totalImage = snapshot.data!.items.length;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BuktiTF()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: backgroundcolor,
                                  ),
                                  child: const Text("See Image"),
                                ),
                              );
                            },
                          ),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.waiting ||
                          !snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }

                      return Container();
                    }),
                // delete button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () async {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyDatabase()));

                    var refImage = firebase_storage.FirebaseStorage.instance;

                    await refImage
                        .ref('BuktiTransfer/$nameImage')
                        .delete()
                        .then((value) => print('deleted successfully'));
                  },
                  child: const Text("Delete Image"),
                ),
              ],
            ),
          ),
          // delete image
          SizedBox(
            width: double.infinity,
            height: 306,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  child: Image.asset("assets/images/wavedashboard-1.png"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
