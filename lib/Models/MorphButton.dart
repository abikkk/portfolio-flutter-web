import 'package:get/get.dart';

class MorphButton extends GetxController {
  RxBool isClicked = false.obs, showDetails = false.obs,isFocused=false.obs;
  RxDouble scale = 0.0.obs, pad = 50.0.obs;
  RxString image = ''.obs, link = ''.obs, image_hovered = ''.obs;

  MorphButton(
      {required this.isClicked,
      required this.showDetails,
      required this.isFocused,
      required this.image,
      required this.image_hovered,
      required this.pad,
      required this.scale,
      required this.link});
}
