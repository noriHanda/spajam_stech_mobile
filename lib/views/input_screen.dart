import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spajam_stech/controllers/upload_image_provider.dart';
import 'package:spajam_stech/networking/storage_client.dart';

class InputScreen extends ConsumerWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadSucceeded = ref.watch(uploadImageProvider) != null;
    File? selectedImage;
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
                  child: uploadSucceeded
                      ? Image(
                          height: 140,
                          image: FileImage(ref.watch(uploadImageProvider)!),
                        )
                      : InkWell(
                          onTap: () async {
                            selectedImage = await selectImage();
                            String? imageUrl;
                            if (selectedImage != null) {
                              imageUrl = await uploadImage(selectedImage!);
                            }
                            if (imageUrl != null) {
                              ref
                                  .read(uploadImageProvider.notifier)
                                  .update((state) => selectedImage);
                            } else {
                              ref
                                  .read(uploadImageProvider.notifier)
                                  .update((state) => null);
                            }
                          },
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

  Future<File?> selectImage() async {
    final imagePicker = ImagePicker();
    await Permission.photos.request();

    final imageXfile = await imagePicker.pickImage(source: ImageSource.gallery);
    
    if (imageXfile == null) {
      return null;
    }
    return File(imageXfile.path);
  }

  Future<String> uploadImage(File image) {
    final storageClient = StorageClient();
    return storageClient.uploadImageAndGetURL(image);
  }
}
