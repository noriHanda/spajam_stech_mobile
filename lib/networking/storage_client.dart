import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageClient {

  final storage = FirebaseStorage.instance;

  Future<String> uploadImage(File image) async {
    const uuid = Uuid();
    final fileName = uuid.v1();
    final ref = storage.ref();
    final task = ref
      ..child(fileName)
      ..putFile(image);

    final imageUrl = await task.getDownloadURL();
    return imageUrl;
  }
}
