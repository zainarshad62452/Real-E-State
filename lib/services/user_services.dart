import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/models/user_model1.dart';
import 'package:realstate/core/components/snackbar.dart';


class UserServices {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  registerUser(
      {required String name,
      required User user,
      String? phoneNumber,
      String? userType}) async {
    var x = UserModel(
        name: name,
        email: user.email,
        phoneNumber: phoneNumber,
        userType: userType,
        uid: user.uid,
        status: "new");
    try {
      await firestore.collection("users").doc(user.uid).set(x.toJson());
      loading(false);
      // Reception().userReception();
    } catch (e) {
      loading(false);
      alertSnackbar("Can't register user");
    }
  }
  // startChatSendMessage({ required String reciver, required String type,required String groupChatId}) async {

  //   try {
  //     var x = firestore.collection("donor").doc(FirebaseAuth.instance.currentUser?.uid)
  //         .collection(reciver)
  //         .doc(DateTime.now().millisecondsSinceEpoch.toString());
  //     ChatModel chat = ChatModel(idFrom: donorCntr.user!.value.uid,idTo: reciver,timestamp: DateTime.now().millisecondsSinceEpoch.toString(),content: groupChatId);
  //     x.set(chat.toJson()).then((value) => print('done'));
  //   } catch (e) {
  //     alertSnackbar("Can't add Item");
  //   }
  // }

  Stream<UserModel>? streamUser() {
    try {
      return firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .snapshots()
          .map((event) {
        if (event.data() != null) {
          return UserModel.fromJson(event.data()!);
        } else {
          return UserModel(status: '');
        }
      });
    } catch (e) {
      return null;
    }
  }

  Stream<List<UserModel>>? streamAllUsers() {
    try {
      return firestore.collection("users").snapshots().map((event) {
        loading(false);
        List<UserModel> list = [];
        event.docs.forEach((element) {
          final admin = UserModel.fromJson(element.data());
          list.add(admin);
        });
        loading(false);
        return list;
      });
    } catch (e) {
      loading(false);
      return null;
    }
  }
}
