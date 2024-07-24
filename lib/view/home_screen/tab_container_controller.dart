import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// This class defines the variables used in the [propert_app_home_screen_tab_container_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PropertAppHomeScreenTabContainerModel {}

/// A controller class for the PropertAppHomeScreenTabContainerScreen.
///
/// This class manages the state of the PropertAppHomeScreenTabContainerScreen, including the
/// current propertAppHomeScreenTabContainerModelObj
class HomeScreenPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  Rx<PropertAppHomeScreenTabContainerModel>
      propertAppHomeScreenTabContainerModelObj =
      PropertAppHomeScreenTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}

/// A binding class for the PropertAppHomeScreenTabContainerScreen.
///
/// This class ensures that the PropertAppHomeScreenTabContainerController is created when the
/// PropertAppHomeScreenTabContainerScreen is first loaded.
class HomeScreenPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenPageController());
  }
}
