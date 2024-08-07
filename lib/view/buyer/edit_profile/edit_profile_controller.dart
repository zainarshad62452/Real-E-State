import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/models/user_model.dart';
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
  void updateProfile() {
    userProfileController.updateUserProfile(
      UserModel(
        uid: userProfileController.user.value.uid,
        name: nameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        status: userProfileController.user.value.status,
        userType: userProfileController.user.value.userType,
      ),
    );
    Get.back(); // Navigate back to the previous screen after updating
  }
}

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}