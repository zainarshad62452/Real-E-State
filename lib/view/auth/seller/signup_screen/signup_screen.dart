import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/core/components/custom_app_bar.dart';
import 'package:realstate/core/components/custom_button.dart';
import 'package:realstate/core/components/custom_outlined_button.dart';
import 'package:realstate/core/components/loading%20.dart';
import 'package:realstate/core/routes/app_routes.dart';
import 'package:realstate/core/utils/responsive.dart';
import 'signup_controller.dart';

class SellerSignupScreen extends GetWidget<SellerSignupController> {
  const SellerSignupScreen({Key? key}) : super(key: key);

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
                      title: "Create account",
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
    return InternationalPhoneNumberInput(
      height: 60,
      controller: controller.phoneInputController,
      inputFormatters: const [],
      formatter: MaskedInputFormatter('##########'),
      initCountry:
          CountryCodeModel(name: "Pakistan", dial_code: "+92", code: "PK"),
      betweenPadding: 23,
      onInputChanged: (phone) {
        
      },
      // loadFromJson: loadFromJson,
      dialogConfig: DialogConfig(
        backgroundColor: const Color(0xFF444448),
        searchBoxBackgroundColor: const Color(0xFF56565a),
        searchBoxIconColor: const Color(0xFFFAFAFA),
        countryItemHeight: 55,
        topBarColor: const Color(0xFF1B1C24),
        selectedItemColor: const Color(0xFF56565a),
        selectedIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            "assets/check.png",
            width: 20,
            fit: BoxFit.fitWidth,
          ),
        ),
        textStyle: TextStyle(
            color: const Color(0xFFFAFAFA).withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w600),
        searchBoxTextStyle: TextStyle(
            color: const Color(0xFFFAFAFA).withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w600),
        titleStyle: const TextStyle(
            color: Color(0xFFFAFAFA),
            fontSize: 18,
            fontWeight: FontWeight.w700),
        searchBoxHintStyle: TextStyle(
            color: const Color(0xFFFAFAFA).withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
      countryConfig: CountryConfig(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFF3f4046)),
            borderRadius: BorderRadius.circular(8),
          ),
          noFlag: false,
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
      validator: (number) {
        if (number.number.isEmpty) {
          return "The phone number cannot be left empty";
        }
        return null;
      },
      phoneConfig: PhoneConfig(
        focusedColor: const Color(0xFF6D59BD),
        enabledColor: const Color(0xFF6D59BD),
        errorColor: const Color(0xFFFF5494),
        labelStyle: null,
        labelText: null,
        floatingLabelStyle: null,
        focusNode: null,
        radius: 8,
        hintText: "Phone Number",
        borderWidth: 2,
        backgroundColor: Colors.transparent,
        decoration: null,
        popUpErrorText: true,
        autoFocus: false,
        showCursor: false,
        textInputAction: TextInputAction.done,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        errorTextMaxLength: 2,
        errorPadding: const EdgeInsets.only(top: 14),
        errorStyle:
            const TextStyle(color: Color(0xFFFF5494), fontSize: 12, height: 1),
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
        hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
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
              "Don’t have an account? Create Your Account",
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
      text: "Sign up",
      onPressed: () {
        controller.onSignUpButtonPressed();
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
