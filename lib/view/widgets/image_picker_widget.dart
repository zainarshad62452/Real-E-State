
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realstate/view/buyer/edit_profile/edit_profile_controller.dart';

class ImagePickerWidget extends StatelessWidget {
  final Function(XFile?) onImageSelected;

  ImagePickerWidget({required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          // Update this block to show the selected image if available
          final profileImage = Get.find<EditProfileController>().profileImage.value;
          return Stack(
            children: [
              Material(
                shape: CircleBorder(),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                    onImageSelected(image);
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: profileImage != null
                        ? FileImage(File(profileImage.path))
                        : null,
                    // backgroundColor: Colors.grey[300],
                    child: profileImage == null
                        ?  Image.asset('assets/images/image_not_found.png')
                        : null,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Material(
                  shape: CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                      onImageSelected(image);
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}


//  Center(
//                       child: Stack(
//                         children: [
//                           CircleAvatar(
//                             radius: 50,
//                             backgroundImage:
//                                 AssetImage('assets/images/image_not_found.png'),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: InkWell(
//                               onTap: () {
//                                 // Functionality to change profile picture
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.blueAccent,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       blurRadius: 4,
//                                       offset: Offset(2, 2),
//                                     ),
//                                   ],
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4.0),
//                                   child: Icon(
//                                     Icons.edit,
//                                     color: Colors.white,
//                                     size: 16,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),