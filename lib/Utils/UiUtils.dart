import 'package:url_launcher/url_launcher.dart';

// web page launcher
openLink(type) async {
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
            Uri.parse('https://www.instagram.com/_abik.vaidhya_/')))
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
        if (!await launchUrl(Uri.parse('https://twitter.com/u_serious_dafuq')))
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
          throw 'Could not launch Apex stats Link!';
        break;
      }
    case 'pubg':
      {
        if (!await launchUrl(
            Uri.parse('https://pubglookup.com/players/steam/thepepepopoman')))
          throw 'Could not launch PUBG stats Link!';
        break;
      }
    case 'gta v':
      {
        if (!await launchUrl(Uri.parse(
            'https://socialclub.rockstargames.com/member/thepepepopoman/')))
          throw 'Could not launch GTA V Social Club Link!';
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
        if (!await launchUrl(Uri.parse('https://www.bandlab.com/abikvaidhya')))
          throw 'Could not launch BandLabs Link!';
        break;
      }
    case 'email':
      {
        if (!await launchUrl(
            Uri.parse('https://www.facebook.com/abik.vaidhya')))
          throw 'Could not launch facebook Link!';
      }
  }
}
