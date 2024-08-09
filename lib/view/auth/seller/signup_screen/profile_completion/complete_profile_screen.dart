import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/core/components/loading%20.dart';
import 'package:realstate/view/auth/seller/signup_screen/profile_completion/complete_profile_controller.dart';

class CNICUploadScreen extends StatelessWidget {
  final CNICUploadController controller = Get.put(CNICUploadController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('Upload CNIC Details'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: controller.nameController,
                      decoration: InputDecoration(labelText: 'Enter your name'),
                    ),
                    SizedBox(height: 20),
                    Text('Upload CNIC Front Image'),
                    SizedBox(height: 10),
                    Obx(() => _buildImagePicker(true)),
                    SizedBox(height: 20),
                    Text('Upload CNIC Back Image'),
                    SizedBox(height: 10),
                    Obx(() => _buildImagePicker(false)),
                    SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: controller.saveDataToFirestore,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          loading() ? LoadingWidget() : SizedBox()
        ],
      ),
    );
  }

  Widget _buildImagePicker(bool isFront) {
    return GestureDetector(
      onTap: () => controller.pickImage(ImageSource.camera, isFront),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _getImageWidget(isFront),
      ),
    );
  }

  Widget _getImageWidget(bool isFront) {
    File? imageFile = isFront
        ? controller.cnicFrontImage.value
        : controller.cnicBackImage.value;
    if (imageFile == null) {
      return Icon(Icons.camera_alt, color: Colors.grey, size: 100);
    } else {
      return Image.file(imageFile, fit: BoxFit.cover);
    }
  }
}
