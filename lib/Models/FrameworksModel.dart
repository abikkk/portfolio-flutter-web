import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class FrameworksModel {
  double value = 0.0;
  String label = '', description = '', hexValue = '';

  // List projects = [];

  FrameworksModel({
    required this.value,
    required this.label,
    required this.description,
    required this.hexValue,
    // required this.projects,
  });

  factory FrameworksModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final docData = documentSnapshot.data()!;
    return FrameworksModel(
      // projects: (docData['projects'] as List<dynamic>),
      value: (double.parse((docData['value'] ?? 0).toString())),
      label: docData['label'].toString(),
      description: docData['description'].toString(),
      hexValue: docData['color'].toString(),
    );
  }
}

class FrameworkProjectsModel {
  String label = '', description = '', link = '';

  FrameworkProjectsModel({
    required this.link,
    required this.label,
    required this.description,
  });

  factory FrameworkProjectsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final docData = documentSnapshot.data()!;
    return FrameworkProjectsModel(
      link: docData['link'].toString(),
      label: docData['label'].toString(),
      description: docData['description'].toString(),
    );
  }
}
