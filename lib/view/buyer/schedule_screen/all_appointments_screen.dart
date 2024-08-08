import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/models/schedule_model.dart';
import 'package:realstate/view/buyer/schedule_screen/schedule_screen.dart';
import 'package:realstate/view/buyer/schedule_screen/schedule_screen_controller.dart';

class AllAppointmentsScreen extends StatelessWidget {
  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Appointments'),
      ),
      body: Obx(() {
        if (scheduleController.scheduleList.isEmpty) {
          return Center(
            child: Text('No Appointments Available'),
          );
        }

        return ListView.builder(
          itemCount: scheduleController.scheduleList.length,
          itemBuilder: (context, index) {
            final schedule = scheduleController.scheduleList[index];

            return GestureDetector(
              onTap: () {
                Get.to(() => ScheduleScreen(), arguments: schedule);
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Stack(
                children: [
                  Center(child: CircularProgressIndicator()), // Loading indicator
                  FadeInImage.assetNetwork(
                    // placeholder: '', // Empty string since we're using CircularProgressIndicator
                    image: 'https://financialresidency.com/wp-content/uploads/2018/05/Multifamily-Housing.jpg', // Replace with actual property image URL
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    fadeInDuration: Duration(milliseconds: 200), // Duration for the fade-in effect
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.error)); // Error icon if image fails to load
                    }, placeholder: 'assets/images/transparent.png',
                  ),
                ],
              ),
            ),),
                  
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Property ID: ${schedule.propertyId ?? 'Unknown'}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Appointment: ${schedule.appointmentTime ?? 'N/A'}',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Status: ${schedule.status ?? 'N/A'}',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 16.0),
                                SizedBox(width: 4.0),
                                Text(
                                  'Location: ${schedule.propertyId ?? 'N/A'}', // Assuming propertyId represents location
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16.0),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
