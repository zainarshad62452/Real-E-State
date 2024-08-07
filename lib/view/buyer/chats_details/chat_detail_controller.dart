import 'package:get/get.dart';

class Message {
  final String content;
  final bool isSentByMe;
  final String time;
  final bool isRead;

  Message({
    required this.content,
    required this.isSentByMe,
    required this.time,
    this.isRead = false,
  });
}

class ChatDetailsController extends GetxController {
  // Define an observable list of messages
  var messagesList = <Message>[].obs;

  // Example initialization of messages
  @override
  void onInit() {
    super.onInit();
    messagesList.addAll([
      Message(
        content: "Hey Gaurav, how’s it going?",
        isSentByMe: false,
        time: "9:10 am",
      ),
      Message(
        content: "Hey! I’m good, just chilling. What about?",
        isSentByMe: true,
        time: "9:10 am",
        isRead: true,
      ),
      Message(
        content: "Same here, just taking it easy. Did you catch that new movie everyone’s talking about?",
        isSentByMe: false,
        time: "9:10 am",
      ),
      Message(
        content: "Oh yeah, I watched it last night. It was awesome! The plot twists were mind-blowing.",
        isSentByMe: true,
        time: "9:10 am",
        isRead: true,
      ),
    ]);
  }

  // Method to send a message
  void sendMessage(String content) {
    if (content.isNotEmpty) {
      messagesList.add(
        Message(
          content: content,
          isSentByMe: true,
          time: "9:11 am", // Example time, you might want to dynamically generate this
          isRead: true,
        ),
      );
    }
  }
}
class ChatsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailsController>(() => ChatDetailsController());
  }
}
// chats changes  by hassan 