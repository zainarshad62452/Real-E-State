import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realstate/controllers/loading_controller.dart';
import 'package:realstate/models/property_model.dart';
import 'package:realstate/core/components/snackbar.dart';

class PropertyServices {
  final firestore = FirebaseFirestore.instance;

  Future<void> addProperty(PropertyModel property) async {
    try {
      await firestore.collection("properties").doc(property.uid).set(property.toJson());
      loading(false);
    } catch (e) {
      loading(false);
      alertSnackbar("Can't add property");
    }
  }

  Future<void> updateProperty(PropertyModel property) async {
    try {
      await firestore.collection("properties").doc(property.uid).update(property.toJson());
      loading(false);
    } catch (e) {
      loading(false);
      alertSnackbar("Can't update property");
    }
  }

  Future<void> deleteProperty(String propertyId) async {
    try {
      await firestore.collection("properties").doc(propertyId).delete();
      loading(false);
    } catch (e) {
      loading(false);
      alertSnackbar("Can't delete property");
    }
  }

  Stream<PropertyModel>? streamProperty(String propertyId) {
    try {
      return firestore.collection("properties").doc(propertyId).snapshots().map((event) {
        if (event.data() != null) {
          return PropertyModel.fromJson(event.data()!);
        } else {
          return PropertyModel();
        }
      });
    } catch (e) {
      return null;
    }
  }

  Stream<List<PropertyModel>>? streamAllProperties() {
    try {
      return firestore.collection("properties").snapshots().map((event) {
        List<PropertyModel> list = [];
        event.docs.forEach((element) {
          final property = PropertyModel.fromJson(element.data());
          list.add(property);
        });
        return list;
      });
    } catch (e) {
      return null;
    }
  }
}
