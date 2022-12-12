// ignore_for_file: constant_identifier_names

import 'package:awesome_marathon_image/pages/auth/binding/auth_binding.dart';
import 'package:awesome_marathon_image/pages/auth/views/login_screen.dart';
import 'package:awesome_marathon_image/pages/auth/views/register_screen.dart';
import 'package:awesome_marathon_image/pages/home/binding/home_binding.dart';
import 'package:awesome_marathon_image/pages/home/views/home.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterScreen(),
      binding: AuthBinding(),
      transition: Transition.downToUp,
    ),
  ];
}
