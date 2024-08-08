import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/core/components/snackbar.dart';
import 'package:realstate/core/routes/app_routes.dart';
import 'package:realstate/services/Authentication.dart';

class RealEstateAppDesigenLoginModel {}

class LoginController extends GetxController {
  TextEditingController emailInputController = TextEditingController();

  TextEditingController passwordInputController = TextEditingController();

  Rx<RealEstateAppDesigenLoginModel> realEstateAppDesigenLoginModelObj =
      RealEstateAppDesigenLoginModel().obs;

  @override
  void onClose() {
    emailInputController.dispose();
    passwordInputController.dispose();
  }

  Future<void> onLoginButtonPressed() async {
    if (emailInputController.text.isEmpty) {
      alertSnackbar("Please enter email address!.");
    } else if (!emailInputController.text.contains('@')) {
      alertSnackbar("Please enter a valid email address!.");
    } else if (passwordInputController.text.isEmpty) {
      alertSnackbar("Please enter password");
    } else {
      await Authentication().signinWithEmail(
          emailInputController.text.toString(),
          passwordInputController.text.toString());
    }
  }

  Future<void> onCreateAccountButtonPressed() async {
    Get.toNamed(AppRoutes.signupScreen);
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
