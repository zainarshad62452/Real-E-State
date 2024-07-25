import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/core/routes/app_routes.dart';
import 'package:realstate/view/auth/email_verification_screen/emailVerification.dart';
import 'package:realstate/view/auth/login_screen/login_screen.dart';
import 'package:realstate/view/buyer/home_screen/tab_container_controller.dart';
import 'Authentication.dart';

class Reception {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<String> fetchUserType() async {
    String type = "none";
    try {
      type = await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) => value['userType'].toString());
    } catch (e) {
      print("::: error is $e");
    }
    return type;
  }

  userReception() async {
    final type = await fetchUserType();
    print("::: usertype is $type");
    if (FirebaseAuth.instance.currentUser != null) {
      if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        Get.toNamed(AppRoutes.emailVerificationScreen);
      } else if (type == "seller") {
        loading(false);
        print("::: Going to home");
  Get.put(HomeScreenPageController());

        Get.offAllNamed(AppRoutes.buyerDashboard);
      } else if (type == "buyer") {
        loading(false);
        print("::: Going to home");
  Get.put(HomeScreenPageController());

        Get.offAllNamed(AppRoutes.buyerDashboard);
      } else {
        Authentication().signOut();
      }
    } else {
      Get.offAllNamed(AppRoutes.loginScreen);
    }
  }
}
