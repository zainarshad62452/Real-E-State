import 'package:get/get.dart';
import 'package:realstate/models/schedule_model.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleController extends GetxController {
  var scheduleList = <ScheduleModel>[].obs;
  var selectedDate = DateTime.now().obs;
  var focusedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch or initialize your schedule data here
    // Example data
    scheduleList.add(ScheduleModel(
      id: '1',
      sellerId: 'seller1',
      buyerId: 'buyer1',
      propertyId: 'property1',
      chatId: 'chat1',
      appointmentTime: '2024-07-19 10:00:00',
      startTime: '2024-07-19 10:00:00',
      status: 'Scheduled',
    ));
  }

  void addSchedule(ScheduleModel schedule) {
    scheduleList.add(schedule);
  }

  void updateSchedule(int index, ScheduleModel schedule) {
    scheduleList[index] = schedule;
  }

  void deleteSchedule(int index) {
    scheduleList.removeAt(index);
  }

  // To handle day selection from the calendar
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    selectedDate.value = selectedDay;
    focusedDate.value = focusedDay;
  }

  // Check if a date has an appointment
  bool isAppointmentDate(DateTime date) {
    return scheduleList.any((schedule) {
      DateTime appointmentDate = DateTime.parse(schedule.appointmentTime!);
      return isSameDay(date, appointmentDate);
    });
  }
}

class ScheduleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(() => ScheduleController());
  }
}
