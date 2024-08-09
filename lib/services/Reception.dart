import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/controllers/property_controller.dart';
import 'package:realstate/controllers/user_controller.dart';
import 'package:realstate/core/routes/app_routes.dart';
import 'package:realstate/view/auth/seller/user_status/user_status_screen.dart';
import 'package:realstate/view/buyer/home_screen/tab_container_controller.dart';
import 'package:realstate/view/seller/seller_dashboard/dashboard_controller.dart';
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

    Future<String> fetchUserStatus() async {
    String type = "";
    try {
      type = await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) => value['status'].toString());
    } catch (e) {
      print("::: error is $e");
    }
    return type;
  }

  userReception() async {
    final type = await fetchUserType();
    print("::: usertype is $type");
    if (FirebaseAuth.instance.currentUser != null) {
      Get.put(UserController(),permanent: true);
      Get.put(PropertyController(),permanent: true);
      // if (!FirebaseAuth.instance.currentUser!.emailVerified) {
      //   FirebaseAuth.instance.currentUser!.sendEmailVerification();
      //   Get.toNamed(AppRoutes.emailVerificationScreen);
      // } else 
      if (type == "Seller") {
        final status = await fetchUserStatus();
        if(status == "verified"){
loading(false);
        print("::: Going to home");
        Get.put(SellerDashboardController());
        Get.offAllNamed(AppRoutes.sellerDashboard);
        }else{
          loading(false);
        print("::: Going to home");
        Get.offAll(()=>UserStatusScreen());
        }
        

        
      } else if (type == "Buyer") {
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
