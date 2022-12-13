import 'package:awesome_marathon_image/pages/image_detail/controller/image_detail_controller.dart';
import 'package:get/get.dart';

class ImageDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageDetailController>(() => ImageDetailController());
  }
}
