import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/core/components/custom_app_bar.dart';
import 'package:realstate/core/components/custom_button.dart';
import 'package:realstate/core/components/custom_outlined_button.dart';
import 'package:realstate/core/components/custom_textfied.dart';
import 'package:realstate/core/components/loading%20.dart';
import 'package:realstate/core/routes/app_routes.dart';
import 'package:realstate/core/utils/responsive.dart';
import 'login_controller.dart';

class SellerLoginScreen extends GetWidget<SellerLoginController> {
  const SellerLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0XFFF2F3F3),
              appBar: CustomAppBar(
                title: "Seller Login account",
                isLeading: false,
              ),
              body: SingleChildScrollView(
                child: Responsive(
                    mobile: _phoneWidget(double.maxFinite),
                    tablet: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _phoneWidget(400),
                      ],
                    ),
                    desktop: Row(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _phoneWidget(500),
                      ],
                    )),
              ),
            ),
            loading() ? LoadingWidget() : SizedBox(),
          ],
        ));
  }

  Widget _phoneWidget(double width) {
    return Container(
      width: width,
      decoration: width == 400 || width == 500
          ? BoxDecoration(
              border: Border.all(color: Colors.black38),
            )
          : BoxDecoration(),
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: width == 500 ? 10 : 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.loginScreen);
                  },
                  child: Text("Sign in as Buyer")),
            ],
          ),
          _buildSignUpForm(width),
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
    );
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
  Widget _buildSignUpForm(double width) {
    return SizedBox(
      width: width,
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
