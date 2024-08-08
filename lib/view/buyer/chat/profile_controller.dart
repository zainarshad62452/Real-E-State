// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:realstate/controllers/user_controller.dart';

// class ProfileController extends GetxController {
//   var userRole = 'Listener'.obs;

//   var name = ''.obs;
//   var country = ''.obs;
//   var age = ''.obs;
//   var gender = ''.obs;
//   var bio = ''.obs;
//   var isActive = false.obs;
//   var selectedTags = <String>[].obs;
//   var profileImage = Rx<XFile?>(null);


//   void toggleActiveStatus() {
//     isActive.value = !isActive.value;
//   }

//   void updateTags(List<String> tags) {
//     selectedTags.value = tags;
//   }

//   void updateProfileImage(XFile? image) {
//     profileImage.value = image;
//   }

//   Future<String?> _uploadImage(XFile image) async {
//     try {
//       final storageRef =
//           FirebaseStorage.instance.ref().child('profile_images/${image.name}');
//       final uploadTask = storageRef.putFile(File(image.path));
//       final snapshot = await uploadTask.whenComplete(() {});
//       return await snapshot.ref.getDownloadURL();
//     } catch (e) {
//       print('::: Error uploading image: $e');
//       return null;
//     }
//   }

//   Future<void> saveProfile() async {
//     loading(true);
//     var user = userCntr.user!.value;
//     print('::: user value before updating ${user.toJson()}');
//     if (profileImage.value != null) {
//       final imageUrl = await _uploadImage(profileImage.value!);
//       if (imageUrl != null) {
//         user.profilePic = imageUrl;
//       }
//     }

//     user.age = age.value;
//     user.bio = bio.value;
//     user.country = country.value;
//     user.name = name.value;
//     user.gender = gender.value;
//     user.tags = selectedTags;
//     user.isActive = isActive.value;

//     print("::: user whil eupdating ${user.toJson()}");
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser?.uid)
//         .update({
//       'name': name.value,
//       'tags': selectedTags,
//       'isActive': isActive.value,
//       'bio': bio.value,
//       'profilePic': user.profilePic,
//       'country': country.value,
//       'age': age.value,
//       'gender': gender.value,
//     });
//     await Reception().userReception();
//   }

//   // bilal ka kam

//   final auth = FirebaseAuth.instance;
//   final db = FirebaseFirestore.instance;
//   final store = FirebaseStorage.instance;
//   RxBool isLoading = false.obs;
//   Rx<UserModel> currentUser = UserModel().obs;

//   @override
//   void onInit() async {
//     super.onInit();
//     await getUserDetails();
//   }

//   Future<void> getUserDetails() async {
//     await db.collection("users").doc(auth.currentUser!.uid).get().then(
//           (value) => {
//             currentUser.value = UserModel.fromJson(
//               value.data()!,
//             ),
//           },
//         );
//   }

//   Future<void> updateProfile(
//     String imageUrl,
//     String name,
//     String about,
//     String number,
//   ) async {
//     isLoading.value = true;
//     try {
//       final imageLink = await uploadFileToFirebase(imageUrl);
//       final updatedUser = UserModel(
//         uid: auth.currentUser!.uid,
//         email: auth.currentUser!.email,
//         name: name,
//         bio: about,
//         profilePic: imageUrl == "" ? currentUser.value.profilePic : imageLink,
//       );
//       await db.collection("users").doc(auth.currentUser!.uid).set(
//             updatedUser.toJson(),
//           );
//       await getUserDetails();
//     } catch (ex) {
//       print(ex);
//     }
//     isLoading.value = false;
//   }

//   Future<String> uploadFileToFirebase(String imagePath) async {
//     final path = "files/${imagePath}";
//     final file = File(imagePath!);
//     if (imagePath != "") {
//       try {
//         final ref = store.ref().child(path).putFile(file);
//         final uploadTask = await ref.whenComplete(() {});
//         final downloadImageUrl = await uploadTask.ref.getDownloadURL();
//         print(downloadImageUrl);
//         return downloadImageUrl;
//       } catch (ex) {
//         print(ex);
//         return "";
//       }
//     }
//     return "";
//   }
// }

// class ProfileScreenBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<ProfileController>(() => ProfileController());
//   }
// }
