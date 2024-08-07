import 'package:get/get.dart';
import 'package:realstate/models/user_model.dart';

class UserProfileController extends GetxController {
  // Simulate loading user data (in a real app, you'd fetch this from a database or API)
  final Rx<UserModel> user = UserModel(
    uid: '1',
    name: 'John Doe',
    email: 'johndoe@example.com',
    phoneNumber: '+1234567890',
    status: 'Active',
    userType: 'Buyer',
  ).obs;

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
