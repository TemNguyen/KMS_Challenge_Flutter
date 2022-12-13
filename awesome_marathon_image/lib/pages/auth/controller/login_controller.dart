import 'package:awesome_marathon_image/pages/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final AuthRepository _repository;
  LoginController(this._repository);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  final TextEditingController passwordController = TextEditingController();
  late SharedPreferences prefs;
  String fullName = '';

  final showPassword = true.obs;
  final isRememberMe = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      emailController = TextEditingController(text: Get.arguments["email"]);
      fullName = Get.arguments["fullName"];
    } else {
      emailController = TextEditingController();
    }
    super.onInit();
  }

  Future<dynamic> login() {
    return _repository.login(emailController.text, passwordController.text);
  }
}
