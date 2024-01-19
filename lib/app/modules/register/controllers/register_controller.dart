import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../user/controllers/user_controller.dart';
import '../../user/models/user_model.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final userRepo = Get.put(UserController());
  final authRepo = Get.put(AuthController());
  void registerUser(String email, String password) {
    authRepo.registerUser(email, password);
  }

  void phoneAuth(String phoneNumber) {
    authRepo.phoneAuth(phoneNumber);
  }

  Future<void> createUser(UserModel userModel) async {
    await userRepo.createUser(userModel);
    phoneAuth(userModel.phone);
  }
}
