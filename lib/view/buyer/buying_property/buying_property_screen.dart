
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/view/buyer/buying_list/buying_list_controller.dart';

class BuyPropertyScreen extends StatelessWidget {
  final BuyingListController controller = Get.put(BuyingListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buying List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image
            Image.network(
              'https://financialresidency.com/wp-content/uploads/2018/05/Multifamily-Housing.jpg', // Replace with actual image URL
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Property Title
                  Text(
                    'The Villa The Lahore Platinum House',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Property Description
                  Text(
                    'Real-estate is a modern real estate app designed to help users find their dream homes while promoting eco-friendly living or',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8.0),
                  // Property Price
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.blue),
                      SizedBox(width: 4.0),
                      Text(
                        '87,000',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  // Ratings and Features
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index < 4 ? Colors.amber : Colors.grey,
                            size: 20.0,
                          );
                        }),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '4.7',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  // Location and Features
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey),
                      SizedBox(width: 4.0),
                      Text('Pakistan, Lahore', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 16.0),
                      Icon(Icons.bed, color: Colors.grey),
                      SizedBox(width: 4.0),
                      Text('2 Beds', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 16.0),
                      Icon(Icons.bathtub, color: Colors.grey),
                      SizedBox(width: 4.0),
                      Text('2 Baths', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  // Location Text
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Location Map
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://www.researchgate.net/profile/Tim-Schwanen/publication/281500633/figure/fig1/AS:284836127739914@1444858289742/A-Map-of-the-city-of-Perth-Australia.png', // Replace with actual map image URL
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Buy Now Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // controller.buyNow();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
