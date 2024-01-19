import 'package:get/get.dart';
import 'package:spc_smartmeter/app/modules/auth/controllers/auth_controller.dart';
import 'package:spc_smartmeter/app/modules/user/controllers/user_controller.dart';

import '../../user/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final authRepo = Get.put(AuthController());
  final userRepo = Get.put(UserController());

  Future<UserModel?> getUserData() async {
    final phone = authRepo.firebaseUser.value?.phoneNumber;
    if (phone != null) {
      return await userRepo.getUserByPhone(phone);
    } else {
      return null;
    }
  }

  Future<void> updateUser(UserModel userModel) async {
    await userRepo.updateUser(userModel);
  }

  Future<void> linkEmail(String email, String password) async {
    await authRepo.linkEmail(email, password);
  }

  Future<void> unlinkEmail() async {
    await authRepo.unlinkEmail();
  }
}
