import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:realstate/models/user_model1.dart';
import 'package:realstate/view/buyer/user_profile/user_profile_controller.dart';

class EditProfileController extends GetxController {
  final UserProfileController userProfileController = Get.find<UserProfileController>();

  // Text Editing Controllers for form fields
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;

  @override
  void onInit() {
    super.onInit();
    // Initialize the text controllers with the current user data
    nameController = TextEditingController(text: userProfileController.user.value.name);
    emailController = TextEditingController(text: userProfileController.user.value.email);
    phoneNumberController = TextEditingController(text: userProfileController.user.value.phoneNumber);
  }

  // Method to update the user profile
  Future<void> updateProfile() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      try {
        // Update user profile in Firestore
        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          'name': nameController.text,
          'email': emailController.text,
          'phoneNumber': phoneNumberController.text,
        });

        // Update the local user profile in the UserProfileController
        userProfileController.updateUserProfile(
          UserModel(
            uid: uid,
            name: nameController.text,
            email: emailController.text,
            phoneNumber: phoneNumberController.text,
            status: userProfileController.user.value.status,
            userType: userProfileController.user.value.userType,
          ),
        );

        Get.back(); // Navigate back to the previous screen after updating
        Get.snackbar('Success', 'Profile updated successfully!', snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        Get.snackbar('Error', 'Failed to update profile. Please try again.', snackPosition: SnackPosition.BOTTOM);
        print('Error updating profile: $e');
      }
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
