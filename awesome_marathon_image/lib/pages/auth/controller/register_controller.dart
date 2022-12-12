import 'package:awesome_marathon_image/pages/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthRepository _repository;
  RegisterController(this._repository);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  final showPassword = true.obs;

  Future<dynamic> register() {
    return _repository.register(emailController.text, passwordController.text, fullnameController.text);
  }
}
