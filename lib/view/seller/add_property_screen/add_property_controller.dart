import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyController extends GetxController {
  final List<String> propertyTypes = ['Apartments', 'House', 'Flat'];

  // Observable properties

  Rx<String?> selectedPropertyType = Rx<String?>(null);

  Rx<File?> _image = Rx<File?>(null);
  RxString inputValue = ''.obs;
  RxInt numberOfBedrooms = 0.obs;
  RxInt numberOfWashrooms = 0.obs;
  RxString furnishingStatus = 'Unfurnished'.obs;

  // Controllers
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dimensionController = TextEditingController();

  File? get image => _image.value;

  // Functions to handle state changes
  void incrementBedrooms() => numberOfBedrooms.value++;
  void decrementBedrooms() =>
      numberOfBedrooms.value > 0 ? numberOfBedrooms.value-- : null;

  void incrementWashrooms() => numberOfWashrooms.value++;
  void decrementWashrooms() =>
      numberOfWashrooms.value > 0 ? numberOfWashrooms.value-- : null;

  void setFurnishingStatus(String? status) {
    if (status != null) {
      furnishingStatus.value = status;
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    }
  }

  @override
  void onClose() {
    // Dispose controllers
    descriptionController.dispose();
    priceController.dispose();
    locationController.dispose();
    dimensionController.dispose();
    super.onClose();
  }
}

class AddPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPropertyController>(() => AddPropertyController());
  }
}
