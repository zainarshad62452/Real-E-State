import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertAppHomeScreenTabContainerModel {}

class HomeScreenPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  Rx<PropertAppHomeScreenTabContainerModel>
      propertAppHomeScreenTabContainerModelObj =
      PropertAppHomeScreenTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));

  // @override
  // void onClose() {
  //   // super.onClose();
  //   searchController.dispose();
  // }
}

class HomeScreenPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenPageController());
  }
}
