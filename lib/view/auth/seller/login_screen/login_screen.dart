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
import 'package:realstate/view/auth/seller/login_screen/login_controller.dart';

class SellerLoginScreen extends GetWidget<SellerLoginController> {
  const SellerLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0XFFF2F3F3),
              appBar: Responsive.isDesktop(context)
                  ? PreferredSize(preferredSize: Size.zero, child: SizedBox())
                  : CustomAppBar(
                      title: "Login account",
                      isLeading: true,
                    ),
              body: SingleChildScrollView(
                  child: Responsive(
                mobile: _buildPhone(double.maxFinite),
                tablet: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildPhone(400),
                  ],
                ),
                desktop: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildPhone(500),
                  ],
                ),
              )),
            ),
            loading() ? LoadingWidget() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhone(double width) {
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
                  child: Text("Signin as Buyer")),
            ],
          ),
          _buildSignUpForm(width),
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
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberInput() {
    return CustomTextField(
      controller: controller.phoneInputController,
      hintText: "Enter your phone number",
      textInputType: TextInputType.phone,
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
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const SizedBox(
            width: 220,
            child: Text(
              "Login into your account.",
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
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return CustomButton(
      text: "Login",
      onPressed: () {
        controller.onLoginButtonPressed();
      },
    );
  }

  Widget _buildLoginButton() {
    return CustomOutlineButton(
      text: "Sign Up",
      onPressed: () {
        controller.onSignUpButtonPressed();
      },
    );
  }
}
