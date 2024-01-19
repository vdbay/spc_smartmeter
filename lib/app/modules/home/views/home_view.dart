import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spc_smartmeter/app/common_widgets/spc_elevatedbutton.dart';
import 'package:spc_smartmeter/app/modules/auth/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body:  Center(
        child: SPCElevatedButton(
          onPressed: () {
            AuthController.instance.signOutUser();
          },
          text: 'Logout',
        ),
      ),
    );
  }
}
