import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/controllers/user_controller.dart';
import 'package:realstate/models/user_model1.dart';
import 'package:realstate/view/buyer/user_profile/user_profile_controller.dart';

class EditProfileController extends GetxController {
  final UserProfileController userProfileController =
      Get.find<UserProfileController>();

  // Text Editing Controllers for form fields
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;

  @override
  void onInit() {
    super.onInit();
    // Initialize the text controllers with the current user data
    nameController =
        TextEditingController(text: userProfileController.user.value.name);
    emailController =
        TextEditingController(text: userProfileController.user.value.email);
    phoneNumberController = TextEditingController(
        text: userProfileController.user.value.phoneNumber);
  }

  var profileImage = Rx<XFile?>(null);

  void updateProfileImage(XFile? image) {
    profileImage.value = image;
  }

  // Method to update the user profile
  Future<void> updateProfile() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    var user = userCntr.user!.value;

    if (uid != null) {
      try {
        loading(true);
        if (profileImage.value != null) {
          final imageUrl = await _uploadImage(profileImage.value!);
          if (imageUrl != null) {
            user.profilePic = imageUrl;
          }
        }

        if (user.profilePic != null) {
          await FirebaseFirestore.instance.collection('users').doc(uid).update({
            'name': nameController.text,
            'email': emailController.text,
            'phoneNumber': phoneNumberController.text,
            'profilePic': user.profilePic
          });
        } else {
          await FirebaseFirestore.instance.collection('users').doc(uid).update({
            'name': nameController.text,
            'email': emailController.text,
            'phoneNumber': phoneNumberController.text,
          });
        }

        // Update the local user profile in the UserProfileController
        userProfileController.updateUserProfile(
          UserModel(
              uid: uid,
              name: nameController.text,
              email: emailController.text,
              phoneNumber: phoneNumberController.text,
              status: userProfileController.user.value.status,
              userType: userProfileController.user.value.userType,
              profilePic: userProfileController.user.value.profilePic ?? ''),
        );

        Get.back(); // Navigate back to the previous screen after updating
        Get.snackbar('Success', 'Profile updated successfully!',
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        Get.snackbar('Error', 'Failed to update profile. Please try again.',
            snackPosition: SnackPosition.BOTTOM);
        print('Error updating profile: $e');
      } finally {
        loading(false);
      }
    }
  }

  Future<String?> _uploadImage(XFile image) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('profile_images/${image.name}');
      final uploadTask = storageRef.putFile(File(image.path));
      final snapshot = await uploadTask.whenComplete(() {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('::: Error uploading image: $e');
      return null;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}
