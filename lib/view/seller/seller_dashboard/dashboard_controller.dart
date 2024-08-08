import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SellerDashboardController extends GetxController {
  var currentPage = 0.obs;
  var isDrawerCollapsed = false.obs;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  void changePage(int index) {
    currentPage.value = index;
  }

  void toggleDrawer() {
    isDrawerCollapsed.value = !isDrawerCollapsed.value;
  }
}

class SellerDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellerDashboardController>(() => SellerDashboardController());
  }
}

