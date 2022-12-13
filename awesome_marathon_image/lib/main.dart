import 'package:awesome_marathon_image/config/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      transitionDuration: const Duration(milliseconds: 350),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.pages,
    );
  }
}