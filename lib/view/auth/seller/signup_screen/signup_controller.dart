import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/core/components/snackbar.dart';
import 'package:realstate/core/routes/app_routes.dart';
import 'package:realstate/services/Authentication.dart';
import 'package:realstate/services/user_services.dart';

class SellerSignupController extends GetxController {
  final phoneInputController = TextEditingController();
  var verificationId = ''.obs;

  void onSignUpButtonPressed() {
    final phoneNumber = "+92${phoneInputController.text.trim()}";
    print("::: phone number $phoneNumber");
    if (phoneNumber.isNotEmpty) {
      Authentication().signUpWithPhoneNumber(
        phoneNumber,
        (verificationId) {
          this.verificationId.value = verificationId;
          snackbar("Success", "OTP sent successfully!.");
          Get.toNamed(AppRoutes.otpVerificationScreen,
              arguments: verificationId);
        },
      );
    } else {
      Get.snackbar("Error", "Please enter your phone number");
    }
  }

  void onLoginButtonPressed() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  void verifyOTP(String otp) async {
    final user = await Authentication()
        .confirmVerificationCode(verificationId.value, otp);
    if (user != null) {
      UserServices().registerUser(
        name: 'Seller Name',
        user: user,
        phoneNumber: user.phoneNumber,
        userType: 'Seller',
      );
      Get.offAllNamed(AppRoutes.sellerDashboard);
    } else {
      Get.snackbar("Error", "Invalid OTP");
    }
  }
}

class SellerSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellerSignupController());
  }
}
