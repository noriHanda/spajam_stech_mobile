import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spajam_stech/networking/storage_client.dart';

class InputScreen extends ConsumerWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(labelText: '名前'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(labelText: '時間'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: InkWell(
                    onTap: uploadImage,
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      height: 140,
                      child: const Center(child: Text('画像を選択')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('登録'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage() async {
    final imagePicker = ImagePicker();
    XFile? image;
    String imageUrl;
    await Permission.photos.request();
    final permissionStatus = await Permission.photos.status;

    print('いいかんじ？ ${permissionStatus.isGranted}');

    // if (permissionStatus.isGranted) {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);
      final storageClient = StorageClient();
      imageUrl = await storageClient.uploadImage(file);
    }
    // }
  }
}
