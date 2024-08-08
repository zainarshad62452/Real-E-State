import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/property_controller.dart';

class PropertyDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PropertyController controller = Get.put(PropertyController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Property Details',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        final property = controller.property!.value;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // property.propertyImages != null &&
              //         property.propertyImages!.isNotEmpty
              // ?
              Image.network(
                'https://financialresidency.com/wp-content/uploads/2018/05/Multifamily-Housing.jpg',

                // property.propertyImages![0],
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              // : Container(height: 250, color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.title ?? '',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: 8),
                    Text(
                      property.address ?? '',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 18, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          'South Lahore',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildFeatureIcon(
                            Icons.bed, '${property.numberOfBedRooms} Rooms'),
                        _buildFeatureIcon(Icons.bathtub,
                            '${property.numberOfBathrooms} Baths'),
                        _buildFeatureIcon(Icons.pool, 'Pools'),
                      ],
                    ),
                    Divider(height: 32),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      property.description ?? '',
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                    Divider(height: 32),
                    Text(
                      'Owner\'s info',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://financialresidency.com/wp-content/uploads/2018/05/Multifamily-Housing.jpg'),
                      ),
                      title: Text('Owner\'s info'),
                      subtitle: Text('South Lahore'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.call, color: Colors.blue),
                            onPressed: () {
                              // Handle call button
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.message, color: Colors.blue),
                            onPressed: () {
                              // Handle message button
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 32),
                    Text(
                      'Per night',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Per night Rs.${property.price}',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Handle book now button
                        },
                        child: Text('Book Now', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
