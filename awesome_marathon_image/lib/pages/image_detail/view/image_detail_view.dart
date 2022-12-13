import 'package:awesome_marathon_image/pages/image_detail/controller/image_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageDetailPage extends GetView<ImageDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(icon: const Icon(Icons.download), onPressed: () {}),
      ]),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(controller.imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
