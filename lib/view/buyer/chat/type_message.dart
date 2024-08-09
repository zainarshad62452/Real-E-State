import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/image_picker_contoller.dart';
import 'package:realstate/core/config/constants.dart';
import 'package:realstate/core/config/theme/themecolor.dart';
import 'package:realstate/models/user_model1.dart';
import 'package:realstate/view/buyer/chat/chats_controller.dart';
import 'package:realstate/view/buyer/chat/image_picker_bottom_sheet.dart';

class TypeMessage extends StatelessWidget {
  final UserModel userModel;
  const TypeMessage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Themecolor.black
          //  gradient: const LinearGradient(
          //   colors: [Themecolor.primary, Themecolor.accentColor],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),

          ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                message.value = value;
                print("typing...");
                if (value.isNotEmpty) {
                  print("typing...");
                } else {
                  print("not typing");
                }
              },
              onEditingComplete: () {
                print("onEditingComplete");
              },
              controller: messageController,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  filled: false,
                  hintText: "Type message ..."),
            ),
          ),
          SizedBox(width: 10),
          // Obx(
          //   () => chatController.selectedImagePath.value == ""
          //       ? InkWell(
          //           onTap: () {
          //             ImagePickerBottomSheet(
          //                 context,
          //                 chatController.selectedImagePath,
          //                 imagePickerController);
          //           },
          //           child: Container(
          //             width: 30,
          //             height: 30,
          //             child: Icon(Icons.image)
          //           ),
          //         )
          //       : SizedBox(),
          // ),
          // SizedBox(width: 10),
          Obx(
            () => message.value != "" ||
                    chatController.selectedImagePath.value != ""
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (messageController.text.isNotEmpty ||
                          chatController.selectedImagePath.value.isNotEmpty) {
                        chatController.sendMessage(
                            userModel.uid!, messageController.text, userModel);
                        messageController.clear();
                        message.value = "";
                      }
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      child: chatController.isLoading.value
                          ? CircularProgressIndicator()
                          : SvgPicture.asset(
                              AppAssetPaths.chatSendSvg,
                              color: Colors.white,
                              width: 25,
                            ),
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
