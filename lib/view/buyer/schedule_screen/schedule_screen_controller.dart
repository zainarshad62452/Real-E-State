import 'package:get/get.dart';
import 'package:realstate/models/schedule_model.dart';

class ScheduleController extends GetxController {
  var scheduleList = <ScheduleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch or initialize your schedule data here
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
}

class ScheduleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(() => ScheduleController());
  }
}
