
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class ImageDetailController extends GetxController {
  late String imageUrl;
  late String imageId;

  final isDownload = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      imageUrl = Get.arguments['imageUrl'];
      imageId = Get.arguments['imageId'];
    }
    super.onInit();
  }

  Future<void> downloadImage() async {
    isDownload.value = true;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = '${tempDir.path}/$imageId.jpg';

    await Dio().download(imageUrl, tempPath);
    await GallerySaver.saveImage(tempPath).then((value) => isDownload.value = false);
  }
}
