import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../localization/hardcoded.dart';
import '../../../constants/text_strings.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel userModel) async {
    try {
      await _db.collection('Users').add(userModel.toJson()).whenComplete(() =>
          Get.snackbar(SPCTextString.successResponse,
              'User created successfully'.hardcoded,
              snackPosition: SnackPosition.BOTTOM));
    } catch (e) {
      Get.snackbar(SPCTextString.errorResponse, e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<UserModel> getUserByEmail(String email) async {
    final snapshot =
        await _db.collection('Users').where('email', isEqualTo: email).get();
    return UserModel.fromDocumentSnapshot(snapshot.docs.first);
  }

  Future<UserModel> getUserByPhone(String phone) async {
    final snapshot =
        await _db.collection('Users').where('phone', isEqualTo: phone).get();
    return UserModel.fromDocumentSnapshot(snapshot.docs.first);
  }

  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await _db.collection('Users').get();
    return snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  }

  Future<void> updateUser(UserModel userModel) async {
    try {
      await _db
          .collection('Users')
          .doc(userModel.id)
          .update(userModel.toJson())
          .whenComplete(() => Get.snackbar(SPCTextString.successResponse,
              'User updated successfully'.hardcoded,
              snackPosition: SnackPosition.BOTTOM));
    } catch (e) {
      Get.snackbar(SPCTextString.errorResponse, e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
