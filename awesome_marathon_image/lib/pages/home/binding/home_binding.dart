import 'package:awesome_marathon_image/core/api_client.dart';
import 'package:awesome_marathon_image/pages/home/controller/home_controller.dart';
import 'package:awesome_marathon_image/pages/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController(
     HomeRepository(ApiClient())));
  }
}