import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Utils/Constants.dart';

class SocialsModel extends GetxController {
  bool showDetails = false;
  Image image, imageReversed;
  String link = '', label = '', description = '';

  SocialsModel({
    required this.showDetails,
    required this.image,
    required this.imageReversed,
    required this.label,
    required this.link,
    required this.description,
  });

  factory SocialsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final docData = documentSnapshot.data()!;
    return SocialsModel(
      showDetails: false,
      image: Image.asset(ImageConstants.imagesPath + docData['icon']),
      imageReversed:
          Image.asset(ImageConstants.imagesPath + docData['icon_reversed']),
      label: docData['label'].toString(),
      link: ((docData['link'] ?? '').toString()),
      description: docData['description'].toString(),
    );
  }
}
