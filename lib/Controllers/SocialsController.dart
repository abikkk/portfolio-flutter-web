import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Models/MorphButton.dart';
import 'package:my_porfolio/Utils/ConstantsImages.dart';

class SocialsController extends GetxController {
  RxList<MorphButton> socialMorphButtons = [
    MorphButton(
        isClicked: false.obs,
        showDetails: false.obs,
        isFocused: false.obs,
        image: Image.asset(ImagesConstants.fb),
        image_hovered: Image.asset(ImagesConstants.fb_hovered),
        pad: 50.0.obs,
        scale: 0.0.obs,
        link: 'fb'.obs),
    MorphButton(
        isClicked: false.obs,
        showDetails: false.obs,
        isFocused: false.obs,
        image: Image.asset(ImagesConstants.ig),
        image_hovered: Image.asset(ImagesConstants.ig_hovered),
        pad: 50.0.obs,
        scale: 0.0.obs,
        link: 'ig'.obs),
    MorphButton(
        isClicked: false.obs,
        showDetails: false.obs,
        isFocused: false.obs,
        image: Image.asset(ImagesConstants.twitter),
        image_hovered: Image.asset(ImagesConstants.twitter_hovered),
        pad: 50.0.obs,
        scale: 0.0.obs,
        link: 'twitter'.obs),
    MorphButton(
        isClicked: false.obs,
        showDetails: false.obs,
        isFocused: false.obs,
        image: Image.asset(ImagesConstants.linkd),
        image_hovered: Image.asset(ImagesConstants.linkd_hovered),
        pad: 50.0.obs,
        scale: 0.0.obs,
        link: 'linkd'.obs),
  ].obs;

  getSocials() {}
}
