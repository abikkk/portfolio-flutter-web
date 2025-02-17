import 'package:flutter/material.dart';
import 'package:my_porfolio/Controllers/MainController.dart';
import 'package:url_launcher/url_launcher.dart';

// functions
class Functions {
  // web page launcher
  static openLink(type) async {
    switch (type) {
      case 'fb':
        {
          if (!await launchUrl(
              Uri.parse("https://www.facebook.com/abik.vaidhya")))
            throw 'Could not launch Facebook Link!';
          break;
        }
      case 'ig':
        {
          if (!await launchUrl(
              Uri.parse('https://www.instagram.com/abik.vaidhya/')))
            throw 'Could not launch Instagram Link!';
        }
        break;
      case 'twitch':
        {
          if (!await launchUrl(Uri.parse('https://www.twitch.tv/uugiebuugie')))
            throw 'Could not launch Twitch Link!';
        }
        break;
      case 'yt':
        {
          if (!await launchUrl(Uri.parse(
              'https://www.youtube.com/channel/UCaPj2jBIWUN7nZQWfyRr1pg')))
            throw 'Could not launch YouTube Link!';
        }
        break;
      case 'twitter':
        {
          if (!await launchUrl(
              Uri.parse('https://twitter.com/u_serious_dafuq')))
            throw 'Could not launch Twitter Link!';
        }
        break;
      case 'linkd':
        {
          if (!await launchUrl(
              Uri.parse('https://www.linkedin.com/in/abik-vaidhya-ab9015168/')))
            throw 'Could not launch LinkedIn Link!';
          break;
        }
      case 'discord':
        {
          if (!await launchUrl(Uri.parse('https://discord.gg/949XfbfzpA')))
            throw 'Could not launch Discord Link!';
          break;
        }
      case 'valorant':
        {
          if (!await launchUrl(Uri.parse(
              'https://tracker.gg/valorant/profile/riot/OogieBoogie%2348Kk/overview')))
            throw 'Could not launch Valorant stats Link!';
          break;
        }
      case 'apex legends':
        {
          if (!await launchUrl(Uri.parse(
              'https://apex.tracker.gg/apex/profile/origin/TheOogieBoogie/overview')))
            throw 'Could not launch Apex Legends stats Link!';
          break;
        }
      case 'gta v':
        {
          if (!await launchUrl(Uri.parse(
              'https://socialclub.rockstargames.com/member/thepepepopoman/')))
            throw 'Could not launch Rockstar Social Club Link!';
          break;
        }
      case 'soundcloud':
        {
          if (!await launchUrl(Uri.parse('https://soundcloud.com/48-ik')))
            throw 'Could not launch SoundCloud Link!';
          break;
        }
      case 'bandlabs':
        {
          if (!await launchUrl(
              Uri.parse('https://www.bandlab.com/abikvaidhya')))
            throw 'Could not launch BandLabs Link!';
          break;
        }
      case 'github':
        {
          if (!await launchUrl(Uri.parse('https://github.com/abikkk')))
            throw 'Could not launch GitHub Link!';
          break;
        }
      case 'gitlab':
        {
          if (!await launchUrl(Uri.parse('https://gitlab.com/abikkk')))
            throw 'Could not launch GitLab Link!';
          break;
        }
      case 'upwork':
        {
          if (!await launchUrl(Uri.parse(
              'https://www.upwork.com/freelancers/~016121bb01f7cc716a?mp_source=share')))
            throw 'Could not launch UpWork Link!';
          break;
        }
      case 'wm':
        {
          if (!await launchUrl(Uri.parse(
              'https://play.google.com/store/apps/details?id=com.wholisticminds.app')))
            throw 'Could not launch UpWork Link!';
          break;
        }
      case 'hnh':
        {
          if (!await launchUrl(Uri.parse(
              'https://play.google.com/store/apps/details?id=com.dev.My_HaH')))
            throw 'Could not launch UpWork Link!';
          break;
        }
      case 'pfd':
        {
          if (!await launchUrl(Uri.parse(
              'https://play.google.com/store/search?q=pokhara%20food%20delivery&c=apps')))
            throw 'Could not launch UpWork Link!';
          break;
        }
      case 'fullmoon':
        {
          if (!await launchUrl(Uri.parse(
              'https://play.google.com/store/apps/details?id=com.beesoul.fullmoon&pli=1')))
            throw 'Could not launch UpWork Link!';
          break;
        }
      default:
        {
          throw '${type}';
        }
    }
  }

// page view navigation
  static navigate(int navIndex, PageController pageController,
      MainController mainController) {
    pageController.animateToPage(navIndex - 1,
        duration: Duration(milliseconds: 444), curve: Curves.easeInOut);
    mainController.navIndex.value = navIndex - 1;
  }

  // precache images
  static precacheImages(MainController mainController, BuildContext context) {
    for (int i = 0; i < mainController.codingMorphButtons.length; i++) {
      precacheImage(mainController.codingMorphButtons[i].image.image, context);
      precacheImage(
          mainController.codingMorphButtons[i].image_hovered.image, context);
    }
    for (int i = 0; i < mainController.codeIDEMorphButtons.length; i++) {
      precacheImage(mainController.codeIDEMorphButtons[i].image.image, context);
    }
    for (int i = 0; i < mainController.gamingMorphButtons.length; i++) {
      precacheImage(mainController.gamingMorphButtons[i].image.image, context);
      precacheImage(
          mainController.gamingMorphButtons[i].image_hovered.image, context);
    }
    for (int i = 0; i < mainController.socialMorphButtons.length; i++) {
      precacheImage(mainController.socialMorphButtons[i].image.image, context);
      precacheImage(
          mainController.socialMorphButtons[i].image_hovered.image, context);
    }
    for (int i = 0; i < mainController.streamMorphButtons.length; i++) {
      precacheImage(mainController.streamMorphButtons[i].image.image, context);
      precacheImage(
          mainController.streamMorphButtons[i].image_hovered.image, context);
    }
    for (int i = 0; i < mainController.jobSocialsMorphButtons.length; i++) {
      precacheImage(
          mainController.jobSocialsMorphButtons[i].image.image, context);
      precacheImage(
          mainController.jobSocialsMorphButtons[i].image_hovered.image,
          context);
    }
    for (int i = 0; i < mainController.musicMorphButtons.length; i++) {
      precacheImage(mainController.musicMorphButtons[i].image.image, context);
      precacheImage(
          mainController.musicMorphButtons[i].image_hovered.image, context);
    }
  }
}
