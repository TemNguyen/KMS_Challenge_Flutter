import 'package:awesome_marathon_image/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  // Future<void> logout() async {
  //   await _apiClient.logout(widget.accesstoken);
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  // }

  Future<dynamic> getImagesByBib() async {
    String bibCode = controller.bibCodeController.text;
    if (bibCode.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Can\'t search with empty value',
        backgroundColor: Color.fromRGBO(207, 27, 36, 1),
      ));
      return;
    }
    Get.printInfo(info: controller.getImagesByBib(bibCode).toString());
    return controller.getImagesByBib(bibCode);
  }

  Future<dynamic> getImagesByName() async {
    String name = controller.nameController.text;
    if (name.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Can\'t search with empty value',
        backgroundColor: Color.fromRGBO(207, 27, 36, 1),
      ));
      return;
    }
    Get.printInfo(info: controller.getImagesByName(name).toString());
    return controller.getImagesByName(name);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Search By Name',
              ),
              Tab(
                text: 'Search By BIB Code',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              height: size.height * 0.8,
              padding: const EdgeInsets.all(12),
              child: Stack(
                children: [
                  _buildSearchButton(
                      controller: controller.nameController,
                      onSearch: getImagesByName),
                ],
              ),
            ),
            Container(
              height: size.height * 0.8,
              padding: const EdgeInsets.all(12),
              child: Stack(
                children: [
                  _buildSearchButton(
                      controller: controller.bibCodeController,
                      onSearch: getImagesByBib,
                      hintText: 'Enter Your Bib Code'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchButton({
    required TextEditingController controller,
    required Function onSearch,
    String? hintText,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText ?? "Enter Your Name",
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 45,
            child: OutlinedButton(
              onPressed: () => onSearch(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text('Search'),
            ),
          ),
        ),
      ],
    );
  }
}
