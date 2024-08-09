import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPVerificationScreen extends GetWidget<SellerSignupController> {
  final otpController = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Enter the OTP sent to your phone number",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            OtpTextField(
              numberOfFields: 6,
              borderColor: Colors.black,
              disabledBorderColor: Colors.grey,
              enabledBorderColor: Colors.blue,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                print("::: Current OTP is $verificationCode");
                otpController.value = verificationCode;
                controller.verifyOTP(verificationCode);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.verifyOTP(otpController.value.trim());
              },
              child: Text(
                "Verify OTP",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
