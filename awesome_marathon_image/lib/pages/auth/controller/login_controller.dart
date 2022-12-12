import 'package:awesome_marathon_image/pages/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepository _repository;
  LoginController(this._repository);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  final showPassword = true.obs;


  Future<dynamic> login() {
    return _repository.login(emailController.text, passwordController.text);
  }
}
