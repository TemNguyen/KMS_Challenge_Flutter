import 'package:awesome_marathon_image/core/api_client.dart';
import 'package:awesome_marathon_image/pages/auth/controller/login_controller.dart';
import 'package:awesome_marathon_image/pages/auth/controller/register_controller.dart';
import 'package:awesome_marathon_image/pages/auth/repository/auth_repository.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(AuthRepository(ApiClient())));

    Get.lazyPut<RegisterController>(
        () => RegisterController(AuthRepository(ApiClient())));
  }
}
