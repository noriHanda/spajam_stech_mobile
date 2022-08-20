import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageClient {

  final storage = FirebaseStorage.instance;

  Future<String> uploadImageAndGetURL(File image) async {
    const uuid = Uuid();
    final fileName = uuid.v1();
    final ref = storage.ref();
    final imageRef = ref.child(fileName);
    await imageRef.putFile(image);
    
    return imageRef.getDownloadURL();
  }
}
