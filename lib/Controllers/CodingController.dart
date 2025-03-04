import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_porfolio/Models/MorphButton.dart';
import 'package:my_porfolio/Models/ProjectCard.dart';
import 'package:my_porfolio/Utils/Constants.dart';
import 'package:my_porfolio/Utils/ConstantsImages.dart';

class CodingController extends GetxController {
  RxList<MorphButton> codingMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.flutter),
            image_hovered: Image.asset(ImagesConstants.flutter_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'flutter'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.react),
            image_hovered: Image.asset(ImagesConstants.react_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'react'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.vue),
            image_hovered: Image.asset(ImagesConstants.vue_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'vue'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.github),
            image_hovered: Image.asset(ImagesConstants.github_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.gitlab),
            image_hovered: Image.asset(ImagesConstants.gitlab_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'gitlab'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.upwork),
            image_hovered: Image.asset(ImagesConstants.upwork_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'upwork'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.projects),
            image_hovered: Image.asset(ImagesConstants.projects_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'projects'.obs),
      ].obs,
      codeIDEMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.vs_code),
            image_hovered: Image.asset(ImagesConstants.vs_code_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'vscode'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.android_studio),
            image_hovered: Image.asset(ImagesConstants.android_studio_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'android_studio'.obs),
      ].obs,
      jobSocialsMorphButtons = [
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.linkd),
            image_hovered: Image.asset(ImagesConstants.linkd_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'linkd'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.github),
            image_hovered: Image.asset(ImagesConstants.github_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'github'.obs),
        MorphButton(
            isClicked: false.obs,
            showDetails: false.obs,
            isFocused: false.obs,
            image: Image.asset(ImagesConstants.gitlab),
            image_hovered: Image.asset(ImagesConstants.gitlab_hovered),
            pad: 50.0.obs,
            scale: 0.0.obs,
            link: 'gitlab'.obs),
      ].obs;

  // coding screen
  final RxBool flutter = false.obs, react = false.obs, vue = false.obs;
  final RxDouble vsOpa = 0.0.obs, asOpa = 0.0.obs;
  final RxDouble vsValue = CONSTANTS.vscodePoints.obs,
      asValue = CONSTANTS.androidStudioPoints.obs;

  // IDE usage maps
  final Map<String, double> projectMap = {
        CONSTANTS.buttonFlutter: CONSTANTS.flutterProjects,
        CONSTANTS.buttonReact: CONSTANTS.reactProjects,
        CONSTANTS.buttonVue: CONSTANTS.vueProjects
      },
      usageFlutter = {
        CONSTANTS.vsCode: 30,
        CONSTANTS.androidStudio: 70,
      },
      usageReact = {
        CONSTANTS.vsCode: 100,
        CONSTANTS.androidStudio: 0,
      },
      usageVue = {
        CONSTANTS.vsCode: 100,
        CONSTANTS.androidStudio: 0,
      };

  // projects
  RxList<ProjectCard> projects = [
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.logoPath + 'white_transparent.png'),
        label: 'portfolio'.obs,
        details:
            'this is my portfolio website developed using flutter web. it contains information about my skillset and what i am available for.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagLaunched,
          CONSTANTS.projectTagWorkingOn,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.wholisticminds),
        label: 'Wholistic Minds'.obs,
        details: 'medical app currently operational in USA.'.obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagAppStore,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.hah),
        label: 'My Hotel and Home'.obs,
        details:
            'home/apartment/flat/rooms/hotel rental application currently operational in Nepal.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagPlayStore,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.logoPath + 'white_transparent.png'),
        label: 'Fullmoon Mobile App'.obs,
        details:
            'construction management application currently operational in Nepal.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagPlayStore,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.pfd),
        label: 'Pokhara Food Delivery App'.obs,
        details:
            'food order/delivery application currently operational in Pokhara.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [CONSTANTS.projectTagCompleted].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.ilg),
        label: 'ILG Order Booking App'.obs,
        details:
            'updated version of ILG Vansales App (Mobile Sales) with then latest dart version (3.0.7), with modified features.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.vansales),
        label: 'ILG Vansales App (Mobile Sales)'.obs,
        details:
            'inventory management and stock order application designed by EBT LLC, Dubai for their clients.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.ebt),
        label: 'EBT Hospitality App'.obs,
        details:
            'menu + mobile POS system for multiple restaurants and lounges for clients of EBT LLC, Dubai.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.tim_hortons),
        label: 'Tim Hortons POS'.obs,
        details:
            'mobile POS application for Tim Hortons clients of EBT LLC, Dubai.'
                .obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagCompleted,
          CONSTANTS.projectTagLaunched,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.logoPath + 'white_transparent.png'),
        label: 'weather app'.obs,
        details: 'a simple weather application.'.obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagWorkingOn,
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.logoPath + 'white_transparent.png'),
        label: 'passenger life'.obs,
        details:
            'portfolio/blog web application for ui/ux designer, Ms. Aayushi Shrestha.'
                .obs,
        devLang: 'flutter web'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.logoPath + 'white_transparent.png'),
        label: 'ghar jagga'.obs,
        details: 'real estate application for Pokhara, Nepal.'.obs,
        devLang: 'flutter'.obs,
        platform: ['android', 'iOS'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagWorkingOn,
          CONSTANTS.projectTagUnder,
        ].obs),
    ProjectCard(
        showDetails: false.obs,
        image: Image.asset(ImagesConstants.logoPath + 'white_transparent.png'),
        label: 'toda mart'.obs,
        details: 'profile website for Toda Mart, Pokhara'.obs,
        devLang: 'react'.obs,
        platform: ['web'].obs,
        link: 'github'.obs,
        tags: [
          CONSTANTS.projectTagUnder,
        ].obs),
  ].obs;

  getCodingDetails() {}
}
