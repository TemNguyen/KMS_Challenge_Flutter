import 'package:awesome_marathon_image/pages/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController bibCodeController = TextEditingController();

  HomeController(this._repository);

  @override
  void dispose() {
    bibCodeController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future<dynamic> getImagesByBib(String bibCode) {
    return _repository.getImagesByBib(bibCode);
  }

  Future<dynamic> getImagesByName(String name) {
    return _repository.getImagesByName(name);
  }
}
