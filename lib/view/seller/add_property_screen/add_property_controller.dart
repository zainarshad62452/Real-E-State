import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/models/property_model.dart';
import 'package:realstate/services/property_services.dart';

class AddPropertyController extends GetxController {
  final List<String> propertyTypes = ['Apartments', 'House', 'Flat'];
  final List<String> properties = ['Rent', 'Sell'];

  Rx<String?> selectedPropertyType = Rx<String?>(null);
  Rx<String?> selectedProperty = Rx<String?>(null);

  RxList<File> images = <File>[].obs;
  RxString inputValue = ''.obs;
  RxInt numberOfBedrooms = 1.obs;
  RxInt numberOfWashrooms = 1.obs;
  RxString furnishingStatus = 'Unfurnished'.obs;
  RxString location = 'No location selected'.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dimensionController = TextEditingController();

  LatLng selectedLatLng = LatLng(30.3753, 69.3451);

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

  Future<void> pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (result != null) {
      images.clear();
      images.addAll(result.paths.map((path) => File(path!)).toList());
    }
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
          "Location Services Disabled", "Please enable location services.");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(
            "Location Permission Denied", "Location permissions are denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Location Permission Denied Forever",
          "Location permissions are permanently denied.");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    selectedLatLng = LatLng(position.latitude, position.longitude);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      location.value =
          "${place.locality}, ${place.subLocality}, ${place.country}";
      locationController.text = location.value;
    }
  }

  void setSelectedLocation(LatLng latLng) async {
    selectedLatLng = latLng;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      location.value =
          "${place.locality}, ${place.subLocality}, ${place.country}";
      locationController.text = location.value;
      latitude.value = latLng.latitude;
      longitude.value = latLng.longitude;
      print("::: Location got ${latitude} & ${longitude}");
    }
  }


void submitProperty() async {
  loading(true);
  
  try {
    // Generate a unique ID for the property
    String propertyId = FirebaseFirestore.instance.collection("properties").doc().id;

    // Upload images to Firebase Storage
    List<String> uploadedImageUrls = [];
    for (var image in images) {
      String fileName = "${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}";
      Reference storageRef = FirebaseStorage.instance.ref().child('property_images/$propertyId/$fileName');
      UploadTask uploadTask = storageRef.putFile(image);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      uploadedImageUrls.add(downloadUrl);
    }

    // Create PropertyModel instance with the collected data
    PropertyModel property = PropertyModel(
      uid:propertyId,
      title: inputValue.value,
      description: descriptionController.text,
      numberOfBedRooms: numberOfBedrooms.value,
      numberOfBathrooms: numberOfWashrooms.value,
      dimensions: double.tryParse(dimensionController.text),
      furnishedType: furnishingStatus.value,
      price: int.tryParse(priceController.text),
      latitude: latitude.value,
      longitude: longitude.value,
      address: location.value,
      propertyImages: uploadedImageUrls,
      propertyType: selectedProperty.value,
      appartmentType: selectedPropertyType.value,
      city: "Your City Name",  // Replace with actual city input
      sellerId: "Your Seller ID", // Replace with actual seller ID
      isSold: false,
    );

    // Use PropertyServices to add the property to Firestore
    await PropertyServices().addProperty(property);

    Get.snackbar("Property Submitted", "Your property has been submitted successfully.");
  } catch (e) {
    Get.snackbar("Error", "Failed to submit property: $e");
  } finally {
    loading(false);
  }
}


  @override
  void onClose() {
    descriptionController.dispose();
    priceController.dispose();
    locationController.dispose();
    dimensionController.dispose();
    super.onClose();
  }
}
