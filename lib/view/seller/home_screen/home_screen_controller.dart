import 'package:get/get.dart';
import 'package:realstate/models/property_model.dart';
import 'package:realstate/services/property_services.dart';
import 'package:flutter/material.dart';
import 'package:realstate/view/seller/add_property_screen/add_property_screen.dart';

class SellerHomeController extends GetxController {
  var allProperties = <PropertyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProperties();
  }

  void fetchUserProperties() {
    allProperties.bindStream(PropertyServices().streamAllProperties()!);
  }

  void deleteProperty(String propertyId) async {
    await PropertyServices().deleteProperty(propertyId);
    allProperties.removeWhere((property) => property.uid == propertyId);
    Get.snackbar('Success', 'Property deleted successfully');
  }

  void addNewProperty() {
    // Navigate to add new property screen
    Get.to(() => AddPropertyScreen());
  }

  void editProperty(PropertyModel property) {

  }

  void viewPropertyDetails(PropertyModel property) {
    
  }
}
