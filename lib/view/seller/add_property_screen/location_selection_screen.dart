import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'add_property_controller.dart';

class MapSelectionScreen extends StatelessWidget {
  final AddPropertyController controller = Get.find<AddPropertyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: controller.selectedLatLng ?? LatLng(30.3753, 69.3451), // Default to Pakistan
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('selectedLocation'),
            position: controller.selectedLatLng ?? LatLng(30.3753, 69.3451),
            draggable: true,
            onDragEnd: controller.setSelectedLocation,
          ),
        },
        onTap: (LatLng latLng) {
          controller.setSelectedLocation(latLng);
          Get.back();
        },
      ),
    );
  }
}
