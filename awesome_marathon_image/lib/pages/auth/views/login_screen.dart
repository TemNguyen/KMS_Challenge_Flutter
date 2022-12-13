import 'package:awesome_marathon_image/config/routes/app_pages.dart';
import 'package:awesome_marathon_image/pages/auth/controller/login_controller.dart';
import 'package:awesome_marathon_image/utils/helper.dart';
import 'package:awesome_marathon_image/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  Future<void> login() async {
    if (controller.formKey.currentState!.validate()) {
      dynamic res = await controller.login();
      Get.printInfo(info: res.toString());

      if (res['error'] == false) {
        String accessToken = res['data'];
        Get.showSnackbar(GetSnackBar(
          message: '${res['message']}',
          backgroundColor: const Color.fromRGBO(3, 167, 55, 1),
        ));
        Helper.saveData("fullName", controller.fullName);
        if (controller.isRememberMe.value) {
          Helper.saveData("email", controller.emailController.text);
          Helper.saveData("token", accessToken);
        }
        Get.offAndToNamed(Routes.HOME);
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
          child: Stack(children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 0.85,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // SizedBox(height: size.height * 0.08),
                          const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.06),
                          TextFormField(
                            controller: controller.emailController,
                            validator: (value) {
                              return Validator.validateEmail(value ?? "");
                            },
                            decoration: InputDecoration(
                              hintText: "Email",
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Obx(
                            () => TextFormField(
                              obscureText: controller.showPassword.value,
                              controller: controller.passwordController,
                              validator: (value) {
                                return Validator.validatePassword(value ?? "");
                              },
                              decoration: InputDecoration(
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
                                hintText: "Password",
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Obx(() => CheckboxListTile(
                                title: const Text("Remember me"),
                                value: controller.isRememberMe.value,
                                onChanged: (bool? newValue) {
                                  controller.isRememberMe.value =
                                      !controller.isRememberMe.value;
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              )),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: login,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.indigo,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15)),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                                onPressed: () => Get.offAndToNamed(Routes.REGISTER),
                                child: const Text('Register')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
