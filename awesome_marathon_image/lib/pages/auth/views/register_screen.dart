import 'package:awesome_marathon_image/config/routes/app_pages.dart';
import 'package:awesome_marathon_image/pages/auth/controller/register_controller.dart';
import 'package:awesome_marathon_image/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  Future<void> registerUsers() async {
    if (controller.formKey.currentState!.validate()) {
      dynamic res = await controller.register();
      Get.printInfo(info: res.toString());

      if (!res['error']) {
        Get.showSnackbar(GetSnackBar(
          message: '${res['message']}',
          backgroundColor: const Color.fromRGBO(3, 167, 55, 1),
        ));
        Get.offAndToNamed(
          Routes.LOGIN,
          arguments: {
            "email": controller.emailController.text,
            "fullName": controller.fullnameController.text
          },
        );
      } else {
        Get.showSnackbar(GetSnackBar(
          message: '${res['message']}',
          backgroundColor: const Color.fromRGBO(207, 27, 36, 1),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Form(
        key: controller.formKey,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: size.width * 0.85,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //   SizedBox(height: size.height * 0.08),
                    const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),

                    SizedBox(height: size.height * 0.03),
                    TextFormField(
                      controller: controller.fullnameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Full name",
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextFormField(
                      validator: (value) =>
                          Validator.validateEmail(value ?? ""),
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Obx(() => TextFormField(
                          obscureText: controller.showPassword.value,
                          validator: (value) =>
                              Validator.validatePassword(value ?? ""),
                          controller: controller.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.showPassword.value =
                                    !controller.showPassword.value;
                              },
                              child: Icon(
                                controller.showPassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
                    SizedBox(height: size.height * 0.06),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: registerUsers,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15)),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () => Get.offAndToNamed(
                                Routes.LOGIN,
                              ),
                          child: const Text('Login')),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
