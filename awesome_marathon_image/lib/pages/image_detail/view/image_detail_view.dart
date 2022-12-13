import 'package:awesome_marathon_image/pages/image_detail/controller/image_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailPage extends GetView<ImageDetailController> {
  const ImageDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              controller.downloadImage();
            }),
      ]),
      body: SafeArea(
        child: PhotoView(imageProvider: NetworkImage(controller.imageUrl)),
      ),
    );
  }
}
