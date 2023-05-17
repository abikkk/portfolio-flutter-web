import 'package:get/get.dart';

class ProjectCard extends GetxController {
  RxBool showDetails = false.obs;
  RxString image = ''.obs, link = ''.obs, label = ''.obs, details = ''.obs;

  ProjectCard(
      {required this.showDetails,
      required this.image,
      required this.label,
      required this.link,
      required this.details});
}
