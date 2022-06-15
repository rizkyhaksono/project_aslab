import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/foundation.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final firebase_storage.Reference storageRef =
      firebase_storage.FirebaseStorage.instance.ref();

  // send image to firebase storage
  Future<void> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);
    try {
      await storage.ref('BuktiTransfer/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // insert files into firebase storage
  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult result =
        await storage.ref('BuktiTransfer/').listAll();

    result.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });

    return result;
  }

  // get pictures from firebase storage
  Future<String> downloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('BuktiTransfer/$imageName').getDownloadURL();
    return downloadURL;
  }
}
