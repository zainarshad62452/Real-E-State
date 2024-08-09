import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:realstate/models/user_model1.dart';

class UserProfileController extends GetxController {
  final Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        
        if (snapshot.exists) {
          user.value = UserModel(
            uid: snapshot.id,
            name: snapshot.data()?['name'] ?? 'N/A',
            email: snapshot.data()?['email'] ?? 'N/A',
            phoneNumber: snapshot.data()?['phoneNumber'] ?? 'N/A',
            status: snapshot.data()?['status'] ?? 'Active',
            userType: snapshot.data()?['userType'] ?? 'Buyer',
            profilePic: snapshot.data()?['profilePic'] ?? '',
          );
        }
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
    }
  }

  // Method to update user profile
  void updateUserProfile(UserModel newUser) {
    user.value = newUser;
  }
}

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileController>(() => UserProfileController());
  }
}