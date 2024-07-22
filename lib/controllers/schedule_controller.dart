import 'package:get/get.dart';
import 'package:realstate/models/schedule_model.dart';
import 'package:realstate/services/schedule_services.dart';

final scheduleCntr = Get.find<ScheduleController>();

class ScheduleController extends GetxController {
  Rx<ScheduleModel>? schedule = ScheduleModel().obs;
  RxList<ScheduleModel>? allSchedules = <ScheduleModel>[].obs;

  @override
  void onReady() {
    initScheduleStream();
  }

  initScheduleStream() async {
    allSchedules!.bindStream(ScheduleServices().streamAllSchedules()!);
  }

  void getSchedule(String scheduleId) {
    schedule!.bindStream(ScheduleServices().streamSchedule(scheduleId)!);
  }
}
