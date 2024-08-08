import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/core/components/snackbar.dart';
import 'package:realstate/core/routes/app_routes.dart';
import 'package:realstate/services/Authentication.dart';

class SignupModel {}

class SignupController extends GetxController {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController phoneInputController = TextEditingController();
  TextEditingController firstNameInputController = TextEditingController();

  TextEditingController passwordInputController = TextEditingController();

  Rx<SignupModel> realEstateAppDesigenLoginModelObj = SignupModel().obs;
  var selectedRole = ''.obs;

  void setRole(String role) {
    selectedRole.value = role;
  }

  @override
  void onClose() {
    super.onClose();
    emailInputController.dispose();
    firstNameInputController.dispose();
    phoneInputController.dispose();
    passwordInputController.dispose();
  }

  Future<void> onCreateAccountButtonPressed() async {
    if (firstNameInputController.text.isEmpty) {
      alertSnackbar("Please enter your name!.");
    } else if (emailInputController.text.isEmpty) {
      alertSnackbar("Please enter email address!.");
    } else if (!emailInputController.text.contains('@')) {
      alertSnackbar("Please enter a valid email address!.");
    } else if (phoneInputController.text.isEmpty) {
      alertSnackbar("Please enter your phone number!.");
    } else if (passwordInputController.text.isEmpty) {
      alertSnackbar("Please enter password");
    } else {
      print("::: Selected Role ${selectedRole.value}");
      await Authentication().createAccount(
          name: firstNameInputController.text.toString(),
          email: emailInputController.text.toString(),
          pass: passwordInputController.text.toString(),
          phoneNumber: phoneInputController.text.toString(),
          userType: selectedRole.value);
    }
  }

  Future<void> onLoginButtonPressed() async {
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}

