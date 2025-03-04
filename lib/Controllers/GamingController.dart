import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Models/MorphButton.dart';
import 'package:my_porfolio/Utils/ConstantsImages.dart';

class GamingController extends GetxController {
  RxList<MorphButton>
  gamingMorphButtons = [
    MorphButton(
        isClicked: false.obs,
        showDetails: false.obs,
        isFocused: false.obs,
        image: Image.asset(ImagesConstants.valorant),
        image_hovered: Image.asset(ImagesConstants.valorant_hovered),
        pad: 50.0.obs,
        scale: 0.0.obs,
        link: 'valorant'.obs),
    MorphButton(
        isClicked: false.obs,
        showDetails: false.obs,
        isFocused: false.obs,
        image: Image.asset(ImagesConstants.apex),
        image_hovered: Image.asset(ImagesConstants.apex_hovered),
        pad: 50.0.obs,
        scale: 0.0.obs,
        link: 'apex legends'.obs),
    MorphButton(
        isClicked: false.obs,
        showDetails: false.obs,
        isFocused: false.obs,
        image: Image.asset(ImagesConstants.gtav),
        image_hovered: Image.asset(ImagesConstants.gtav_hovered),
        pad: 50.0.obs,
        scale: 0.0.obs,
        link: 'gta v'.obs),
  ].obs,
      streamMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: true.obs,
            image: Image.asset(ImagesConstants.yt),
            image_hovered: Image.asset(ImagesConstants.yt_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'yt'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.twitch),
            image_hovered: Image.asset(ImagesConstants.twitch_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'twitch'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.discord),
            image_hovered: Image.asset(ImagesConstants.discord_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'discord'.obs),
      ].obs;
  // gaming screen
  final RxBool ytHover = false.obs,
      twitchHover = false.obs,
      discordHover = false.obs;

  getGamingDetails() {}
}
