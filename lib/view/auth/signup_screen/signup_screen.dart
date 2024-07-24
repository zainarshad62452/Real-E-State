import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/core/components/custom_app_bar.dart';
import 'package:realstate/core/components/custom_button.dart';
import 'package:realstate/core/components/custom_outlined_button.dart';
import 'package:realstate/core/components/custom_textfied.dart';
import 'package:realstate/core/components/loading%20.dart';
import 'signup_controller.dart';

class SignupScreen extends GetWidget<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0XFFF2F3F3),
              appBar: const CustomAppBar(
                title: "Create account",
                isLeading: true,
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      _buildSignUpForm(),
                      const SizedBox(height: 48),
                      _buildSignUpButton(),
                      const SizedBox(height: 12),
                      const Text(
                        "OR",
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildLoginButton(),
                    ],
                  ),
                ),
              ),
            ),
            loading() ? LoadingWidget() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstNameInput() {
    return CustomTextField(
      controller: controller.firstNameInputController,
      hintText: "Enter your name",
    );
  }

  Widget _buildPhoneNumberInput() {
    return CustomTextField(
      controller: controller.phoneInputController,
      hintText: "Enter your phone number",
      textInputType: TextInputType.phone,
    );
  }

  /// Section Widget
  Widget _buildEmailInput() {
    return CustomTextField(
      controller: controller.emailInputController,
      hintText: "Enter your email",
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildPasswordInput() {
    return CustomTextField(
      controller: controller.passwordInputController,
      hintText: "Enter your password",
      isObscure: true,
    );
  }

  /// Section Widget
  Widget _buildSignUpForm() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0XFF075EF5),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const SizedBox(
            width: 220,
            child: Text(
              "Don’t have an account Create You're Account",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0XCC000000),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            "First Name",
            style: TextStyle(
              color: Color(0XCC000000),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          _buildFirstNameInput(),
          const SizedBox(height: 16),
          const Text(
            "Phone Number",
            style: TextStyle(
              color: Color(0XCC000000),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          _buildPhoneNumberInput(),
          const SizedBox(height: 16),
          const Text(
            "Email",
            style: TextStyle(
              color: Color(0XCC000000),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          _buildEmailInput(),
          const SizedBox(height: 16),
          const Text(
            "Password",
            style: TextStyle(
              color: Color(0XCC000000),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          _buildPasswordInput(),
          const SizedBox(height: 12),
          _buildRoleSelection(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRoleSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: Color(0XFF075EF5),
              value: controller.selectedRole.value == 'Buyer',
              onChanged: (value) {
                if (value == true) {
                  controller.setRole('Buyer');
                }
              },
            ),
            Text(
              "Buyer",
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              activeColor: Color(0XFF075EF5),
              value: controller.selectedRole.value == 'Seller',
              onChanged: (value) {
                if (value == true) {
                  controller.setRole('Seller');
                }
              },
            ),
            Text(
              "Seller",
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ],
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSignUpButton() {
    return CustomButton(
      text: "Sign up",
      onPressed: () {
        controller.onCreateAccountButtonPressed();
      },
    );
  }

  Widget _buildLoginButton() {
    return CustomOutlineButton(
      text: "Login",
      onPressed: () {
        controller.onLoginButtonPressed();
      },
    );
  }
}
