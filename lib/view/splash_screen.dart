import 'dart:async';

import 'package:flutter/material.dart';
import 'package:realstate/services/Reception.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    Future.delayed(const Duration(seconds: 2), () async {
      await Reception().userReception();
    });
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Color.fromARGB(255, 255, 200, 0)],
            ),
            // image: DecorationImage(
            //   image: AssetImage(
            //       // ImageConstant.imgLogo21,
            //       ""),
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
      ),
    );
  }
}
