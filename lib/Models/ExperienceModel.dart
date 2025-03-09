import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get/get.dart';

class ExperienceModel {
  RxString description = ''.obs,
      name = ''.obs,
      location = ''.obs,
      title = ''.obs;
  RxList responsibilities = [].obs;
  Rx<DateTime> startDate = DateTime.now().obs, endDate = DateTime.now().obs;

  ExperienceModel({
    required this.description,
    required this.name,
    required this.location,
    required this.title,
    required this.responsibilities,
    required this.startDate,
    required this.endDate,
  });

  factory ExperienceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final docData = documentSnapshot.data()!;
    return ExperienceModel(
      description: docData['description'].toString().obs,
      name: docData['name'].toString().obs,
      location: docData['location'].toString().obs,
      title: docData['title'].toString().obs,
      responsibilities: (docData['responsibilities'] as List).obs,
      startDate: DateTime.fromMicrosecondsSinceEpoch(
              int.parse(docData['start_date'].toString()))
          .obs,
      endDate: DateTime.fromMicrosecondsSinceEpoch(
              int.parse(docData['end_date'].toString()))
          .obs,
    );
  }
}
