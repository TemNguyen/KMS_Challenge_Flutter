import 'package:awesome_marathon_image/pages/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController bibCodeController = TextEditingController();

  RxList<String> bibImages = RxList();
  RxList<String> nameImages = RxList();

  HomeController(this._repository);

  @override
  void dispose() {
    bibCodeController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future<void> getImagesByBib(String bibCode) async {
    List<String> listImages = await _repository.getImagesByBib(bibCode);
    if (listImages.isNotEmpty) {
      List<String> listIds = [];
      String imageId = '';
      for (String element in listImages) {
        imageId = _getListImage(element);
        listIds.add('https://drive.google.com/uc?export=view&id=$imageId');
      }
      bibImages.assignAll(listIds);
      bibImages.refresh();
    }
  }

  Future<void> getImagesByName(String name) async {
    List<String> listImages = await _repository.getImagesByName(name);
    if (listImages.isNotEmpty) {
      List<String> listIds = [];
      String imageId = '';
      for (String element in listImages) {
        imageId = _getListImage(element);
        listIds.add('https://drive.google.com/uc?export=view&id=$imageId');
      }
      bibImages.assignAll(listIds);
      bibImages.refresh();
    }
  }

  String _getListImage(String inputList) {
    List<String> split = inputList.split('/');
    return split.last;
  }
}
