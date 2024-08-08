import 'package:get/get.dart';
import 'package:realstate/models/property_model.dart';

class RentPropertyDetailController extends GetxController {
  final property = PropertyModel().obs;

  // This is just a placeholder function to simulate fetching property details.
  void fetchPropertyDetails() {
    property.value = PropertyModel(
      uid: "1",
      title: "The Villa The Lahore Platinum House",
      description: "Real-estate is a modern real estate app designed to help users find their dream homes while promoting eco-friendly living or Red More...",
      numberOfBedRooms: 4,
      numberOfBathrooms: 2,
      isKitchen: true,
      dimensions: 200.0,
      isParking: true,
      furnishedType: "Furnished",
      numberOfFloor: 2,
      price: 500,
      latitude: -6.2088,
      longitude: 106.8456,
      address: "Educt street, Yogyakarta, Central Java",
      sellerId: "1",
      solledTo: "2",
      isSold: false,
      propertyImages: ["image_url_1"],
      appartmentType: "Villa",
      rating: 4.7,
      reviews: [
        Review(userId: "1", comment: "Great place!", date: DateTime.now(), rating: 4.5),
      ],
    );
  }

  @override
  void onInit() {
    fetchPropertyDetails();
    super.onInit();
  }
}

class RentPropertyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentPropertyDetailController>(() => RentPropertyDetailController());
  }
}
