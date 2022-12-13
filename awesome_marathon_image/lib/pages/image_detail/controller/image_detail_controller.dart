import 'package:get/get.dart';

class ImageDetailController extends GetxController {
  late String imageUrl;
  late String imageId;

  @override
  void onInit() {
    if (Get.arguments != null) {
      imageUrl = Get.arguments['imageUrl'];
      imageId = Get.arguments['imageId'];
    }
    super.onInit();
  }
}
