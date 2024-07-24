import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/core/components/custom_app_bar.dart';
import 'package:realstate/core/components/custom_button.dart';
import 'package:realstate/core/components/custom_outlined_button.dart';
import 'package:realstate/core/components/loading%20.dart';
import 'package:realstate/core/components/snackbar.dart';
import 'package:realstate/services/Authentication.dart';
import 'package:realstate/services/Reception.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  _ForgotPasswordVerificationPageState createState() =>
      _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState extends State<EmailVerification> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;

    return Stack(
      children: [
        !loading()
            ? Scaffold(
                appBar: CustomAppBar(
                  title: "Account Verification",
                  isLeading: false,
                ),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SafeArea(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(25, 100, 25, 10),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Verification',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                      // textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'A verification Email is sent you on your email address ${FirebaseAuth.instance.currentUser!.email} \nIf you unable to find in mail check the spam folder or resend again.',
                                      style: TextStyle(
                                          // fontSize: 20,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                      // textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.0),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 50.0),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "If you didn't receive a mail! ",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              color: Colors.black38,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Resend',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                loading(true);
                                                try {
                                                  final auth = FirebaseAuth
                                                      .instance.currentUser!;
                                                  await auth
                                                      .sendEmailVerification()
                                                      .then((value) {
                                                    snackbar("Success",
                                                        "Verification send to ${auth.email}");
                                                    loading(false);
                                                  }).onError(
                                                          (error, stackTrace) {
                                                    loading(false);
                                                    alertSnackbar(
                                                        'Unable to send email');
                                                  });
                                                } catch (e) {
                                                  loading(false);
                                                  alertSnackbar('$e');
                                                }
                                              },
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 40.0),
                                    CustomButton(
                                        text: "Verify",
                                        onPressed: () async {
                                          loading(true);
                                          final auth = FirebaseAuth
                                              .instance.currentUser!;
                                          await auth.reload();
                                          if (auth.emailVerified) {
                                            Reception().userReception();
                                          } else {
                                            alertSnackbar(
                                                'Not Verified!\nCheck your Email again\n Also check spam folder');
                                            loading(false);
                                          }
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              const Text(
                                "OR",
                                style: TextStyle(
                                  color: Color(0XFF000000),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              CustomOutlineButton(
                                  text: 'Logout',
                                  onPressed: () {
                                    Authentication().signOut();
                                  }),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
            : LoadingWidget(),
        LoadingWidget()
      ],
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import '../../Services/Reception.dart';
// import '../widgets/snackbar.dart';
//
// class EmailVerification extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//     // return Scaffold(
//     //
//     //     body: Column(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       crossAxisAlignment: CrossAxisAlignment.center,
//     //       children: [
//     //         Text(
//     //             "Verification email is sent to ${FirebaseAuth.instance.currentUser!.email} \nPlease verify that email in your inbox and then refresh",
//     //             textAlign: TextAlign.center),
//     //         SizedBox(height: 4.h),
//     //         Text("If you can't find this email please check your SPAM",
//     //             style: TextStyle(color: Colors.red)),
//     //         SizedBox(height: 4.h),
//     //         MaterialButton(
//     //             child:Text("Refresh"), onPressed: () async {
//     //           final auth = FirebaseAuth.instance.currentUser!;
//     //           await auth.reload();
//     //           if (auth.emailVerified) {
//     //             Reception().userReception();
//     //           }
//     //         }),
//     //         SizedBox(height: 4.h),
//     //         MaterialButton(child:Text("Resend"),onPressed:  () async {
//     //           final auth = FirebaseAuth.instance.currentUser!;
//     //           await auth.sendEmailVerification();
//     //           snackbar("Success", "Verification send to ${auth.email}");
//     //         }),
//     //         SizedBox(height: 4.h),
//     //       ],
//     //     ));
//   }
// }
