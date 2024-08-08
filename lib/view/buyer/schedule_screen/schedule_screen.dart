import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/view/buyer/schedule_screen/schedule_screen_controller.dart';

class ScheduleScreen extends StatelessWidget {
  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      'https://financialresidency.com/wp-content/uploads/2018/05/Multifamily-Housing.jpg'), // Replace with actual image URL
                  SizedBox(height: 8.0),
                  Text(
                    'Scheduling and Appointments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text('4.88 (370 reviews)'),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Real-estate is a modern real estate app designed to help users find their dream homes.',
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text('Lahore, Pakistan.'),
                    ],
                  ),
                ],
              ),
            ),
            // Date and Calendar
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '19,Jul , 2024',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(7, (index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle date selection
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            color:
                                index == 5 ? Colors.blue : Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            (11 + index).toString(),
                            style: TextStyle(
                              color: index == 5 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Bottom Navigation Bar
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
