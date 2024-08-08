import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/view/buyer/buying_list/buying_list_controller.dart';

class BuyingListScreen extends StatelessWidget {
  final BuyingListController controller = Get.put(BuyingListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Buying Listhhh'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(() {
          final property = controller.property.value;
          if (property == null) {
            return Center(child: CircularProgressIndicator());
          }
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    property.propertyImages?.first ?? '',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.title ?? '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '\$${property.price}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            property.isSold ?? false ? 'Sold' : 'For Sale',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 12,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            property.address ?? '',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconWithText(
                              icon: Icons.aspect_ratio,
                              text: '${property.dimensions} sqft'),
                          IconWithText(
                              icon: Icons.bed,
                              text: '${property.numberOfBedRooms} Beds'),
                          IconWithText(
                              icon: Icons.bathtub,
                              text: '${property.numberOfBathrooms} Baths'),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.phone),
                            color: Colors.green,
                            onPressed: controller.onCallButtonPressed,
                          ),
                          SizedBox(width: 1),
                          IconButton(
                            icon: Icon(Icons.message),
                            color: Colors.green,
                            onPressed: controller.onMessageButtonPressed,
                          ),
                          Spacer(),
                          IconButton.filled(
                            onPressed: controller.onBuyNowButtonPressed,
                            icon: Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          IconWithText(
                              icon: Icons.visibility,
                              text: '${controller.views} Views',
                              color: Colors.blue),
                          SizedBox(width: 8),
                          IconWithText(
                              icon: Icons.new_releases,
                              text: property.isSold ?? false ? 'Old' : 'New',
                              color: Colors.purple),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  IconWithText(
      {required this.icon, required this.text, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  ActionButton(
      {required this.icon, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: color,
        padding: EdgeInsets.all(12),
      ),
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
    );
  }
}
