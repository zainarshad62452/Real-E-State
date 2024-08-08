import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/view/buyer/schedule_screen/schedule_screen_controller.dart';
import 'package:realstate/models/schedule_model.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatelessWidget {
  final ScheduleController scheduleController = Get.put(ScheduleController());
  final ScheduleModel schedule = Get.arguments;

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    if (schedule.appointmentTime != null) {
      selectedDate = DateTime.parse(schedule.appointmentTime!);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: Column(
        children: [
          // Header with image and details
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Using Stack to add a loading indicator
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0), // Rounded corners
                  child: Stack(
                    children: [
                      Center(child: CircularProgressIndicator()), // Loading indicator
                      FadeInImage.assetNetwork(
                        placeholder: 'assets/images/transparent.png',
                        image: 'https://financialresidency.com/wp-content/uploads/2018/05/Multifamily-Housing.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200.0,
                        fadeInDuration: Duration(milliseconds: 200),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Center(child: Icon(Icons.error)); // Error icon if image fails to load
                        },
                      ),
                    ],
                  ),
                ),
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
                    Text('4.88 (370 reviews)'), // Example static data
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
                    Text('Lahore, Pakistan.'), // Example static data
                  ],
                ),
              ],
            ),
          ),
          // Date and Calendar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appointment Time: ${schedule.appointmentTime ?? 'N/A'}', // Display appointment time
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8.0),
                Obx(() {
                  return TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: scheduleController.focusedDate.value,
                    selectedDayPredicate: (day) {
                      return isSameDay(scheduleController.selectedDate.value, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      scheduleController.onDaySelected(selectedDay, focusedDay);
                    },
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        if (scheduleController.isAppointmentDate(date)) {
                          return Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              width: 36,
                              height: 36,
                              child: Center(
                                child: Text(
                                  date.day.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
