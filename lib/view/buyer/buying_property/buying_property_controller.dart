import 'package:get/get.dart';

class BuyingListController extends GetxController {
  void buyNow() {
    // Handle buy now logic
    Get.snackbar('Success', 'Purchase initiated successfully!');
  }
}
class BuyingPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyingListController>(() => BuyingListController());
  }
}
