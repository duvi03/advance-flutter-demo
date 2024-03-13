
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:demo/core/z_file_core.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> imgFromCamera({required BuildContext context, bool isPopNeeded = true}) async {
  if (isPopNeeded) Get.back(); //Navigator.pop(context);
  try {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    File? croppedImage = await cropImage(image?.path ?? "");
    Console.debug(croppedImage,key: "Upload Picture imgFromCamera");
    return croppedImage;
  } catch (e) {
    Console.debug(e);
    return null;
  }
}

Future<File?> imgFromGallery({required BuildContext context, bool isPopNeeded = true}) async {
  if (isPopNeeded) Get.back();
  try {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    File? croppedImg = await cropImage(image?.path);
    Console.debug(croppedImg,key: "Upload Picture imgFromGallery");
    if (croppedImg != null) {
      return croppedImg;
    }
  } catch (e) {
    Console.debug(e, key: "Image From Gallery");
    return null;
  }
  return null;
}

Future<File?> cropImage(String? filePath) async {
  try {
    if (filePath == null) {
      return null;
    }
    File? croppedImg = await ImageCropper().cropImage(
      sourcePath: filePath,
      cropStyle: CropStyle.rectangle,
      aspectRatioPresets: [CropAspectRatioPreset.original, CropAspectRatioPreset.original, CropAspectRatioPreset.ratio4x3],
    );
    if (croppedImg == null) {
      return null;
    }
    return File(croppedImg.path);
  } catch (e) {
    Console.debug(e, key: "Crop Picker");
    return null;
  }
}
