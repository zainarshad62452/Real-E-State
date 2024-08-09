import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/user_controller.dart';
import 'package:realstate/view/buyer/chat/chat_screen.dart';
import 'package:realstate/view/buyer/chat/chat_tile.dart';
import 'package:realstate/view/buyer/chat/chats_controller.dart';
import 'package:realstate/view/buyer/chat/contact_controller.dart';


class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController = Get.put(ContactController());
    UserController profileController = Get.put(UserController());
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Select contact"),
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [

          
            Obx(
              () => Column(
                children: contactController.userList
                    .map(
                      (e) => InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(ChatPage(userModel: e));
                        },
                        child: ChatTile(
                          imageUrl:
                              e.profilePic ?? '',
                          name: e.name ?? "User",
                          lastChat:   "Hey there",
                          lastTime: e.email ==
                                  profileController.user?.value.email
                              ? "You"
                              : "",
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
