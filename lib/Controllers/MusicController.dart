import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Models/MorphButton.dart';
import 'package:my_porfolio/Utils/ConstantsImages.dart';

class MusicController extends GetxController{
  RxList<MorphButton>
  musicMorphButtons = [
    MorphButton(
        isClicked: false.obs,
        showDetails: false.obs,
        isFocused: false.obs,
        image: Image.asset(ImagesConstants.soundcloud),
        image_hovered: Image.asset(ImagesConstants.soundcloud_hovered),
        pad: 50.0.obs,
        scale: 0.0.obs,
        link: 'soundcloud'.obs),
    MorphButton(
        isClicked: false.obs,
        showDetails: false.obs,
        isFocused: false.obs,
        image: Image.asset(ImagesConstants.bandlab),
        image_hovered: Image.asset(ImagesConstants.bandlab_hovered),
        pad: 50.0.obs,
        scale: 0.0.obs,
        link: 'bandlabs'.obs),
  ].obs;
}