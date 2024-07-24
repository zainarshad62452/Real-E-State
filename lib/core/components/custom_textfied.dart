import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final EdgeInsets contentPadding;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.isObscure = false,
      this.textInputAction = TextInputAction.done,
      this.contentPadding = const EdgeInsets.all(16),
      this.textInputType = TextInputType.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: FocusNode(),
      autofocus: true,
      controller: controller,
      style: const TextStyle(
        color: Color(0X99000000),
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      textInputAction: textInputAction,
      keyboardType: textInputType,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0X99000000),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0XFFCCCCCC),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0XFFCCCCCC),
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0XFFCCCCCC),
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0XFFCCCCCC),
            width: 1,
          ),
        ),
        filled: true,
        fillColor: const Color(0XFFFFFFFF),
        isDense: true,
        contentPadding: contentPadding,
      ),
    );
  }
}
