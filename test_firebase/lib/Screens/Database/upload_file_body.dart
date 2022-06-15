import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:test_firebase/Screens/BuktiTransfer/bukti_body.dart';
import 'package:test_firebase/Screens/BuktiTransfer/bukti_screen.dart';
import 'package:test_firebase/Screens/Database/storage_service.dart';
import 'package:test_firebase/constants.dart';

class uploadFileBody extends StatelessWidget {
  uploadFileBody({Key? key}) : super(key: key);
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: storage.listFiles(),
      builder: (BuildContext context,
          AsyncSnapshot<firebase_storage.ListResult> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: snapshot.data!.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: backgroundcolor,
                    ),
                    child: Text(
                        "Image path : ${snapshot.data!.items[index].name}"),
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
      },
    );
  }
}
