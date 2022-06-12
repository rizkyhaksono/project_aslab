import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/foundation.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

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

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult result =
        await storage.ref('BuktiTransfer').listAll();

    result.items.forEach((firebase_storage.Reference ref) {
      if (kDebugMode) {
        print('Found File: $ref');
      }
    });

    return result;
  }
}
