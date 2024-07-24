import 'package:get/get.dart';
import 'propert_app_home_filter_screen.dart';

/// This class is used in the [chipviewall_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ChipviewallItemModel {
  Rx<String>? all = Rx("All");

  Rx<bool>? isSelected = Rx(false);
}

/// This class is used in the [chipviewany_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ChipviewanyItemModel {
  Rx<String>? any = Rx("Any");

  Rx<bool>? isSelected = Rx(false);
}

/// This class is used in the [chipviewany_one_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ChipviewanyOneItemModel {
  Rx<String>? anyOne = Rx("Any");

  Rx<bool>? isSelected = Rx(false);
}

/// This class is used in the [chipviewfree_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ChipviewfreeItemModel {
  Rx<String>? freeWifi = Rx("free Wi-Fi");

  Rx<bool>? isSelected = Rx(false);
}

/// This class defines the variables used in the [propert_app_home_filter_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PropertAppHomeFilterModel {
  Rx<List<ChipviewallItemModel>> chipviewallItemList =
      Rx(List.generate(6, (index) => ChipviewallItemModel()));

  Rx<List<ChipviewanyItemModel>> chipviewanyItemList =
      Rx(List.generate(4, (index) => ChipviewanyItemModel()));

  Rx<List<ChipviewanyOneItemModel>> chipviewanyOneItemList =
      Rx(List.generate(4, (index) => ChipviewanyOneItemModel()));

  Rx<List<ChipviewfreeItemModel>> chipviewfreeItemList =
      Rx(List.generate(5, (index) => ChipviewfreeItemModel()));
}

/// A controller class for the PropertAppHomeFilterScreen.
///
/// This class manages the state of the PropertAppHomeFilterScreen, including the
/// current propertAppHomeFilterModelObj
class PropertAppHomeFilterController extends GetxController {
  Rx<PropertAppHomeFilterModel> propertAppHomeFilterModelObj =
      PropertAppHomeFilterModel().obs;
}

/// A binding class for the PropertAppHomeFilterScreen.
///
/// This class ensures that the PropertAppHomeFilterController is created when the
/// PropertAppHomeFilterScreen is first loaded.
class PropertAppHomeFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertAppHomeFilterController());
  }
}
