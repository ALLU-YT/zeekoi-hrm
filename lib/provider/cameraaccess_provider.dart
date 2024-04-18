import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraAccessProvider extends ChangeNotifier {
  File? selectedImage;
  Uint8List? image;

  Future<void> pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    selectedImage = File(returnImage.path);
    image = await selectedImage!.readAsBytes();
    notifyListeners();
  }
}
