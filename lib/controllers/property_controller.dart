import 'package:get/get.dart';
import 'package:realstate/models/property_model.dart';
import 'package:realstate/services/property_services.dart';

final propertyCntr = Get.find<PropertyController>();

class PropertyController extends GetxController {
  Rx<PropertyModel>? property = PropertyModel().obs;
  RxList<PropertyModel>? allProperties = <PropertyModel>[].obs;

  @override
  void onReady() {
    initPropertyStream();
  }

  initPropertyStream() async {
    allProperties!.bindStream(PropertyServices().streamAllProperties()!);
  }

  void getProperty(String propertyId) {
    property!.bindStream(PropertyServices().streamProperty(propertyId)!);
  }
}
