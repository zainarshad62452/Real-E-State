import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realstate/core/components/hotel_card.dart';
import 'package:realstate/core/components/property_card.dart';
import 'package:realstate/models/property_model.dart';
import 'package:realstate/view/home_screen/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  PropertAppHomeScreenController controller =
      Get.put(PropertAppHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            _buildMostPopularSection(),
            SizedBox(height: 20),
            _buildNewListingSection(),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMostPopularSection() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Most Popular",
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      "More offers",
                      style: TextStyle(
                        color: Color(0XB2000000),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: SvgPicture.asset(
                      "assets/images/img_arrow_right.svg",
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 300,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return HotelCard(
                      property: PropertyModel(
                          uid: "123",
                          title: "Hotel Dark Diamon",
                          description: "A beautiful luxury apartment",
                          numberOfBedRooms: 3,
                          numberOfBathrooms: 2,
                          isKitchen: true,
                          dimensions: 120.5,
                          isParking: true,
                          furnishedType: "Fully Furnished",
                          numberOfFloor: 5,
                          price: 500,
                          latitude: 33.6844,
                          longitude: 73.0479,
                          address: "Islamabad, Pakistan",
                          sellerId: "seller123",
                          solledTo: null,
                          isSold: false,
                          propertyImages: [
                            "assets/images/img_rectangle_34625889.png"
                          ],
                          appartmentType: "Apartment"));
                }),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNewListingSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Listing",
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Column(
            children: List.generate(5, (value) {
              return PropertyCard(
                  property: PropertyModel(
                uid: "123",
                title: "Art Institution",
                description: "A beautiful art institution",
                numberOfBedRooms: 2,
                numberOfBathrooms: 2,
                isKitchen: true,
                dimensions: 120.5,
                isParking: true,
                furnishedType: "Fully Furnished",
                numberOfFloor: 5,
                price: 823,
                latitude: 33.6844,
                longitude: 73.0479,
                address: "Chicago, US",
                sellerId: "seller123",
                solledTo: null,
                isSold: false,
                propertyImages: ["assets/images/img_rectangle_34625893.png"],
                appartmentType: "Apartment",
              ));
            }),
          )
        ],
      ),
    );
  }
}
