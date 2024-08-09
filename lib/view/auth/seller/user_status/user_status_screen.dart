import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/user_controller.dart';
import 'package:realstate/services/Reception.dart';

class UserStatusScreen extends StatelessWidget {
  final UserController controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    // Fetch the user status when the screen is first loaded

    return Scaffold(
      appBar: AppBar(
        title: Text('User Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                'User Status: ${controller.user?.value.status}',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Reception().userReception(),
              child: Text(
                'Check Verification',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
