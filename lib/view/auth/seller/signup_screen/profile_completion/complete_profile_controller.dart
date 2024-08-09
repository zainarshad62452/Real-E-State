import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/services/Reception.dart';

class CNICUploadController extends GetxController {
  final nameController = TextEditingController();
  var cnicFrontImage = Rxn<File>();
  var cnicBackImage = Rxn<File>();
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source, bool isFront) async {
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: 20);
    if (pickedFile != null) {
      if (isFront) {
        cnicFrontImage.value = File(pickedFile.path);
      } else {
        cnicBackImage.value = File(pickedFile.path);
      }
    }
  }

  Future<void> saveDataToFirestore() async {
    print(":::: Cureent user id ${FirebaseAuth.instance.currentUser?.uid}");
    print(
        ":::: Cureent user id ${FirebaseAuth.instance.currentUser?.phoneNumber}");

    loading(true);
    if (nameController.text.isEmpty ||
        cnicFrontImage.value == null ||
        cnicBackImage.value == null) {
      Get.snackbar("Error", "Please fill in all fields and upload images.");
      loading(false);
      return;
    }

    try {
      final frontImageUrl =
          await _uploadImageToStorage(cnicFrontImage.value!, 'cnic_front');
      final backImageUrl =
          await _uploadImageToStorage(cnicBackImage.value!, 'cnic_back');

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid);
      doc.set({
        'name': nameController.text,
        'cnic_front_url': frontImageUrl,
        'cnic_back_url': backImageUrl,
        'userType': 'Seller',
        'status': "new",
        'uid': FirebaseAuth.instance.currentUser?.uid,
        'email': '',
        'phoneNumber': FirebaseAuth.instance.currentUser?.phoneNumber
      });
      Reception().userReception();

      Get.snackbar("Success", "Data saved successfully.");
    } catch (e) {
      print("::: error is ${e.toString()}");
      Get.snackbar("Error", "Failed to save data. Please try again.");
    } finally {
      loading(false);
    }
  }

  Future<String> _uploadImageToStorage(File image, String fileName) async {
    print("::: Uploading ${fileName}");
    Reference storageReference = FirebaseStorage.instance.ref().child(
        'cnic_images/${DateTime.now().millisecondsSinceEpoch}_$fileName');
    UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot storageTaskSnapshot = await uploadTask;
    return await storageTaskSnapshot.ref.getDownloadURL();
  }
}
