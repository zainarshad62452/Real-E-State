import 'package:get/get.dart';

/// This class defines the variables used in the [propert_app_home_screen_page],
/// and is typically used to hold data that is passed between different parts of the application.
class PropertAppHomeScreenModel {}

/// A controller class for the PropertAppHomeScreenPage.
///
/// This class manages the state of the PropertAppHomeScreenPage, including the
/// current propertAppHomeScreenModelObj
class PropertAppHomeScreenController extends GetxController {

}

class PropertAppHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertAppHomeScreenController());
  }
}
