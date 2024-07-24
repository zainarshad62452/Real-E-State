import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/core/components/custom_app_bar.dart';
import 'package:realstate/core/components/custom_button.dart';
import 'package:realstate/core/components/custom_outlined_button.dart';
import 'package:realstate/core/components/custom_textfied.dart';
import 'package:realstate/core/components/loading%20.dart';
import 'login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0XFFF2F3F3),
              appBar: CustomAppBar(
                title: "Login account",
                isLeading: false,
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 28,
                  ),
                  child: Column(
                    children: [
                      _buildSignUpForm(),
                      const SizedBox(height: 48),
                      _buildLoginButton(),
                      const SizedBox(height: 18),
                      const Text(
                        "OR",
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 18),
                      _buildSignUpButton(),
                    ],
                  ),
                ),
              ),
            ),
            loading() ? LoadingWidget() : SizedBox(),
          ],
        ));
  }

  /// Section Widget
  Widget _buildEmailInput() {
    return CustomTextField(
      controller: controller.emailInputController,
      hintText: "Enter your email",
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
            "Login",
            style: TextStyle(
              color: Color(0XFF075EF5),
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const SizedBox(
            width: 220,
            child: Text(
              "Welcome!",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0XCC000000),
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Email",
            style: TextStyle(
              color: Color(0XCC000000),
              fontSize: 18,
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
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          _buildPasswordInput()
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return CustomButton(
      text: "Login",
      onPressed: () {
        controller.onLoginButtonPressed();
      },
    );
  }

  Widget _buildSignUpButton() {
    return CustomOutlineButton(
      text: "Create An Account",
      onPressed: () {
        controller.onCreateAccountButtonPressed();
      },
    );
  }
}
