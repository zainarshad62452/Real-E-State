import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/core/components/snackbar.dart';
import 'package:realstate/core/routes/app_routes.dart';
import 'package:realstate/services/Authentication.dart';
import 'package:realstate/services/user_services.dart';
import 'package:realstate/view/auth/seller/signup_screen/profile_completion/complete_profile_screen.dart';

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

  Future<String> fetchUserType(User user) async {
    String type = "none";
    try {
      type = await FirebaseFirestore.instance
          .collection("users")
          .doc()
          .get()
          .then((value) => value['userType'].toString());
    } catch (e) {
      print("::: error is $e");
    }
    return type;
  }

  void verifyOTP(String otp) async {
    print("::: OTP code is $otp");
    final user = await Authentication()
        .confirmVerificationCode(verificationId.value, otp);
    if (user != null) {
      String type = await fetchUserType(user);
      if (type != "" || type != "none") {
        Get.offAll(() => CNICUploadScreen());
      } else {
        Get.offAllNamed(AppRoutes.sellerDashboard);
      }
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
