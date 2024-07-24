import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/models/schedule_model.dart';
import 'package:realstate/core/components/snackbar.dart';

class ScheduleServices {
  final firestore = FirebaseFirestore.instance;

  Future<void> addSchedule(ScheduleModel schedule) async {
    try {
      await firestore.collection("schedules").doc(schedule.id).set(schedule.toJson());
      loading(false);
    } catch (e) {
      loading(false);
      alertSnackbar("Can't add schedule");
    }
  }

  Future<void> updateSchedule(ScheduleModel schedule) async {
    try {
      await firestore.collection("schedules").doc(schedule.id).update(schedule.toJson());
      loading(false);
    } catch (e) {
      loading(false);
      alertSnackbar("Can't update schedule");
    }
  }

  Future<void> deleteSchedule(String scheduleId) async {
    try {
      await firestore.collection("schedules").doc(scheduleId).delete();
      loading(false);
    } catch (e) {
      loading(false);
      alertSnackbar("Can't delete schedule");
    }
  }

  Stream<ScheduleModel>? streamSchedule(String scheduleId) {
    try {
      return firestore.collection("schedules").doc(scheduleId).snapshots().map((event) {
        if (event.data() != null) {
          return ScheduleModel.fromJson(event.data()!);
        } else {
          return ScheduleModel();
        }
      });
    } catch (e) {
      return null;
    }
  }

  Stream<List<ScheduleModel>>? streamAllSchedules() {
    try {
      return firestore.collection("schedules").snapshots().map((event) {
        List<ScheduleModel> list = [];
        event.docs.forEach((element) {
          final schedule = ScheduleModel.fromJson(element.data());
          list.add(schedule);
        });
        return list;
      });
    } catch (e) {
      return null;
    }
  }
}
