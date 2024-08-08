import 'package:get/get.dart';
import 'package:realstate/models/user_model1.dart';
import 'package:realstate/services/user_services.dart';



final userCntr = Get.find<UserController>();

class UserController extends GetxController {
  Rx<UserModel>? user = UserModel().obs;
  RxList<UserModel>? allUsers = <UserModel>[].obs;
  @override
  void onReady() {
    initAdminStream();
  }

  initAdminStream() async {
    user!.bindStream(UserServices().streamUser()!);
    allUsers!.bindStream(UserServices().streamAllUsers()!);
  }
}
