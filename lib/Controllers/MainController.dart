import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Models/MorphButton.dart';
// import '../Screens/Coding.dart';
// import '../Screens/Contact.dart';
// import '../Screens/Gaming.dart';
// import '../Screens/Head.dart';
// import '../Screens/Music.dart';
// import '../Screens/Socials.dart';

class MainController extends GetxController {
  // main
  final PageController pageController = PageController(
    initialPage: 0,
  );
  // final RxList<Widget> pages = [
  //   HomeScreen(),
  //   CodingScreen(),
  //   GamingScreen(),
  //   MusicScreen(),
  //   SocialsContainer(),
  //   ContactContainer()
  // ].obs;

  // navigation bar
  final RxInt hoverID = 0.obs, navIndex = 0.obs, navIconID = 0.obs;
  final RxDouble navHovered = 0.0.obs,
      bgTop = 0.0.obs,
      headerTop = 0.0.obs,
      pad = 50.0.obs,
      scale = 0.0.obs;

// morphic buttons
  RxList<MorphButton> codingMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            image: 'flutter'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'react'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'vue'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs)
      ].obs,
      gamingMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            image: 'valorant'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'valorant'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'apex'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'apex legends'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'gtav'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'gta v'.obs),
      ].obs,
      socialMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            image: 'fb'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'fb'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'ig'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'ig'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'twitter'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'twitter'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'linkd'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'linkd'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'yt'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'yt'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'twitch'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'twitch'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'discord'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'discord'.obs),
      ].obs,
      musicMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            image: 'soundCloud'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'soundcloud'.obs),
        MorphButton(
            isClicked: false.obs,
            image: 'bandlab'.obs,
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'bandlabs'.obs),
      ].obs;

  // RxBool fbClicked = false.obs,
  //     igClicked = false.obs,
  //     twitterClicked = false.obs,
  //     linkdClicked = false.obs,
  //     ytClicked = false.obs,
  //     twitchClicked = false.obs,
  //     discordClicked = false.obs;
  // RxDouble fbScale = 0.0.obs,
  //     igScale = 0.0.obs,
  //     twitterScale = 0.0.obs,
  //     linkdScale = 0.0.obs,
  //     ytScale = 0.0.obs,
  //     twitchScale = 0.0.obs,
  //     discordScale = 0.0.obs,
  //     fbPad = 50.0.obs,
  //     igPad = 50.0.obs,
  //     twitterPad = 50.0.obs,
  //     linkdPad = 50.0.obs,
  //     ytPad = 50.0.obs,
  //     twitchPad = 50.0.obs,
  //     discordPad = 50.0.obs;
  // RxString fbImage = 'fb'.obs,
  //     igImage = 'ig'.obs,
  //     ttImage = 'twitter'.obs,
  //     linkdImage = 'linkd'.obs,
  //     ytImage = 'yt'.obs,
  //     twitchImage = 'twitch'.obs,
  //     discordImage = 'discord'.obs;

  // final buttonDetails = {
  //       'flutterDetails': false.obs,
  //       'vueDetails': false.obs,
  //       'dnetDetails': false.obs,
  //       'reactDetails': false.obs,
  //       'twitchDetails': false.obs,
  //       'discordDetails': false.obs,
  //       'ytDetails': false.obs,
  //       'valorantDetails': false.obs,
  //       'apexDetails': false.obs,
  //       'pubgDetails': false.obs,
  //       'gtavDetails': false.obs,
  //     },
  //     buttonClicked = {
  //       'twitchClicked': false.obs,
  //       'discordClicked': false.obs,
  //       'ytClicked': false.obs,
  //       'valorantClicked': false.obs,
  //       'apexClicked': false.obs,
  //       'pubgClicked': false.obs,
  //       'gtavClicked': false.obs
  //     },
  //     buttonScale = {
  //       'flutterScale': 0.0.obs,
  //       'cScale': 0.0.obs,
  //       'reactScale': 0.0.obs,
  //       'vueScale': 0.0.obs,
  //       'dnetScale': 0.0.obs,
  //       'discordScale': 0.0.obs,
  //       'twitchScale': 0.0.obs,
  //       'ytScale': 0.0.obs,
  //       'valorantScale': 0.0.obs,
  //       'apexScale': 0.0.obs,
  //       'pubgScale': 0.0.obs,
  //       'gtavScale': 0.0.obs,
  //     },
  //     buttonPad = {
  //       'flutterPad': 5.0.obs,
  //       'cPad': 5.0.obs,
  //       'reactPad': 5.0.obs,
  //       'vuePad': 5.0.obs,
  //       'dnetPad': 5.0.obs
  //     };
}
