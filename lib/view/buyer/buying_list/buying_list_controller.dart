import 'package:get/get.dart';
import 'package:realstate/models/property_model.dart';

class BuyingListController extends GetxController {
  var property = Rxn<PropertyModel>();

  // Sample data for the controller
  BuyingListController() {
    // Initialize with sample data
    property.value = PropertyModel(
      title: 'The Platinum House',
      price: 87000,
      isSold: false,
      address: 'Pakistan, Lahore',
      dimensions: 1400,
      numberOfBedRooms: 2,
      numberOfBathrooms: 2,
      propertyImages: [                'https://financialresidency.com/wp-content/uploads/2018/05/Multifamily-Housing.jpg'],
      // Add other fields as necessary
    );
  }

  // Sample views count
  final int views = 1000;

  // Methods to handle actions
  void onCallButtonPressed() {
    // Handle call button pressed
  }

  void onMessageButtonPressed() {
    // Handle message button pressed
  }

  void onBuyNowButtonPressed() {
    // Handle buy now button pressed
  }
}

class BuyingListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyingListController>(() => BuyingListController());
  }
}
