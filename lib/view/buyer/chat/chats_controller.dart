import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:realstate/models/chat_model.dart';
import 'package:realstate/models/chat_room_model.dart';
import 'package:realstate/models/user_model1.dart';
import 'package:realstate/view/buyer/chat/contact_controller.dart';
import 'package:realstate/view/buyer/chat/profile_controller.dart';
import 'package:realstate/view/buyer/user_profile/user_profile_controller.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class Chat {
  final String name;
  final String lastMessage;

  Chat({required this.name, required this.lastMessage});
}

class ChatController extends GetxController {
  var recentChats = <Chat>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some dummy data
    fetchRecentChats();
  }

  void fetchRecentChats() {
    recentChats.value = [
      Chat(name: "Alice", lastMessage: "Hey, how are you?"),
      Chat(name: "Bob", lastMessage: "Can we meet tomorrow?"),
      Chat(name: "Charlie", lastMessage: "Let's catch up later."),
    ];
  }

  void navigateToChat(Chat chat) {
    // Handle navigation to the chat screen
    // For now, just print the chat name
    print("Navigating to chat with ${chat.name}");
    // Example:
    // Get.toNamed(AppRoutes.chat, arguments: chat);
  }

// bilal ka kam 

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  var uuid = Uuid();
  RxString selectedImagePath = "".obs;
  @override
  UserProfileController profileController = Get.put(UserProfileController());
  
  ContactController contactController = Get.put(ContactController());

  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  UserModel getSender(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.uid!;
    String targetUserId = targetUser.uid!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUser;
    } else {
      return targetUser;
    }
  }

  UserModel getReciver(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.uid!;
    String targetUserId = targetUser.uid!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return targetUser;
    } else {
      return currentUser;
    }
  }

  Future<void> sendMessage(
      String targetUserId, String message, UserModel targetUser) async {
    isLoading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomId(targetUserId);
    DateTime timestamp = DateTime.now();
    String nowTime = DateFormat('hh:mm a').format(timestamp);

    UserModel sender =
        getSender(profileController.user.value, targetUser);
    UserModel receiver =
        getReciver(profileController.user.value, targetUser);

    RxString imageUrl = "".obs;
    // if (selectedImagePath.value.isNotEmpty) {
    //   imageUrl.value =
    //       await profileController.uploadFileToFirebase(selectedImagePath.value);
    // }
    var newChat = ChatModel(
      id: chatId,
      message: message,
      imageUrl: imageUrl.value,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      senderName: profileController.user.value.name,
      timestamp: DateTime.now().toString(),
      readStatus: "unread",
    );

    var roomDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimestamp: nowTime,
      sender: sender,
      receiver: receiver,
      timestamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );
    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(
            newChat.toJson(),
          );
      selectedImagePath.value = "";
      await db.collection("chats").doc(roomId).set(
            roomDetails.toJson(),
          );
      await contactController.saveContact(targetUser);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Stream<List<ChatModel>> getMessages(String targetUserId) {
    String roomId = getRoomId(targetUserId);
    return db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ChatModel.fromJson(doc.data()),
              )
              .toList(),
        );
  }

  Stream<UserModel> getStatus(String uid) {
    return db.collection('users').doc(uid).snapshots().map(
      (event) {
        return UserModel.fromJson(event.data()!);
      },
    );
  }


  Stream<int> getUnreadMessageCount(
    String roomId,
  ) {
    return db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .where("readStatus", isEqualTo: "unread")
        .where("senderId", isNotEqualTo: profileController.user.value.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  Future<void> markMessagesAsRead(String roomId) async {
    QuerySnapshot<Map<String, dynamic>> messagesSnapshot = await db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .where("readStatus", isEqualTo: "unread")
        .get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> messageDoc
        in messagesSnapshot.docs) {
      String senderId = messageDoc.data()["senderId"];
      if (senderId != profileController.user.value.uid) {
        await db
            .collection("chats")
            .doc(roomId)
            .collection("messages")
            .doc(messageDoc.id)
            .update({"readStatus": "read"});
      }
    }
  }


}

class recentChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}

