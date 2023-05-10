import 'package:get/get.dart';

class MorphButton extends GetxController {
  RxBool isClicked = false.obs;
  RxDouble scale = 0.0.obs, pad = 50.0.obs;
  RxString image = ''.obs, link = ''.obs;

  MorphButton(
      {required this.isClicked,
      required this.image,
      required this.pad,
      required this.scale,
      required this.link});
}
