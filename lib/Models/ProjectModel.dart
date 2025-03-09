import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Utils/Constants.dart';

class ProjectModel extends GetxController {
  RxBool showDetails = false.obs;
  Image image;
  RxString link = ''.obs,
      label = ''.obs,
      description = ''.obs,
      devLang = ''.obs;
  RxList tags = [].obs, platform = [].obs;

  ProjectModel({
    required this.showDetails,
    required this.image,
    required this.label,
    required this.link,
    required this.devLang,
    required this.description,
    required this.platform,
    required this.tags,
  });

  factory ProjectModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final docData = documentSnapshot.data()!;
    return ProjectModel(
      showDetails: false.obs,
      image: Image.asset(ImageConstants.projectsPath + docData['icon']),
      label: docData['label'].toString().obs,
      link: ((docData['link'] ?? '').toString()).obs,
      devLang: docData['dev'].toString().obs,
      description: docData['description'].toString().obs,
      platform: [docData['platform'].toString()].obs,
      tags: [docData['status'].toString()].obs,
    );
  }
}
