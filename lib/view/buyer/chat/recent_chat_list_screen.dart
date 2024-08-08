import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/user_controller.dart';
import 'package:realstate/models/chat_room_model.dart';
import 'package:realstate/view/buyer/chat/chat_screen.dart';
import 'package:realstate/view/buyer/chat/chat_tile.dart';
import 'package:realstate/view/buyer/chat/chats_controller.dart';
import 'package:realstate/view/buyer/chat/contact_controller.dart';
import 'package:realstate/view/buyer/user_profile/user_profile_controller.dart';

class RecentChatsListScreen extends StatelessWidget {
  const RecentChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    UserProfileController profileController = Get.put(UserProfileController());
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Recent Chats'),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<List<ChatRoomModel>>(
        stream: contactController.getChatRoom(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          List<ChatRoomModel>? e = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: e!.length,
            itemBuilder: (context, index) {
              print('::: ${[index]} my id ${userCntr.user!.value.uid}');
              print('::: Op id ${e[index].sender!.uid}');
              return e[index].sender!.uid != userCntr.user!.value.uid
                  ? SizedBox()
                  : InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        chatController.markMessagesAsRead(e[index].id!);
                        Get.to(
                          ChatScreen(
                            userModel: (e[index].receiver!.uid ==
                                    profileController.user.value.uid
                                ? e[index].sender
                                : e[index].receiver)!,
                          ),
                        );
                      },
                      // child: ChatTile(
                      //   imageUrl: (e[index].receiver!.uid ==
                      //               profileController.currentUser.value.uid
                      //           ? e[index].sender!.profilePic
                      //           : e[index].receiver!.profilePic) ??
                      //       AssetsImage.defaultProfileUrl,
                      //   name: (e[index].receiver!.uid ==
                      //           profileController.currentUser.value.uid
                      //       ? e[index].sender!.name
                      //       : e[index].receiver!.name)!,
                      //   lastChat: e[index].lastMessage ?? "Last Message",
                      //   lastTime: e[index].lastMessageTimestamp ?? "Last Time",
                      // ),
                    );
            },
          );
        },
      ),
    );
  }
}
