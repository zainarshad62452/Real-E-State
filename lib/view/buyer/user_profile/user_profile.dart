import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/core/config/theme/themecolor.dart';
import 'package:realstate/view/buyer/user_profile/user_profile_controller.dart';
import 'package:realstate/view/widgets/network_image.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProfileController controller = Get.put(UserProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.edit),
          //   onPressed: () {
          //     Get.toNamed('/edit-profile');
          //     // Navigate to edit profile screen or implement edit functionality
          //   },
          // ),
        ],
      ),
      body: Obx(() {
        if (controller.user.value.uid == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Header with Image
                  // Center(
                  //   child: CircleAvatar(
                  //     radius: 50,
                  //     backgroundImage:
                  //         AssetImage('assets/images/image_not_found.png'),
                  //   ),
                  // ),
                  NetworkImageWidget(imageUrl:controller.user.value.profilePic),
                  const SizedBox(height: 20),

                  // User Information
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserInfoRow(
                          label: 'Name',
                          value: controller.user.value.name ?? 'N/A',
                        ),
                        const Divider(),
                        UserInfoRow(
                          label: 'Email',
                          value: controller.user.value.email ?? 'N/A',
                        ),
                        const Divider(),
                        UserInfoRow(
                          label: 'Phone',
                          value: controller.user.value.phoneNumber ?? 'N/A',
                        ),
                        
                        const Divider(),
                        UserInfoRow(
                          label: 'User Type',
                          value: controller.user.value.userType ?? 'N/A',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed('/edit-profile');
                        },
                        icon: Icon(Icons.edit),
                        label: const Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          backgroundColor: const Color.fromARGB(255, 253, 252, 252),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement logout functionality
                    },
                    icon: Icon(Icons.logout),
                    label: const Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      backgroundColor: Themecolor.primary,
                      foregroundColor: Themecolor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}

// Reusable User Info Row Widget
class UserInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const UserInfoRow({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
