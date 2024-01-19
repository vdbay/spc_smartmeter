import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spc_smartmeter/app/modules/auth/controllers/auth_controller.dart';
import 'package:spc_smartmeter/app/routes/app_pages.dart';

class OtpController extends GetxController {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();
  final TextEditingController otpController5 = TextEditingController();
  final TextEditingController otpController6 = TextEditingController();

  void verifyOTP() async {
    String otp = otpController1.text.trim() +
        otpController2.text.trim() +
        otpController3.text.trim() +
        otpController4.text.trim() +
        otpController5.text.trim() +
        otpController6.text.trim();
    bool isVerified = await AuthController.instance.verifyOTP(otp);
    isVerified ? Get.offAllNamed(Routes.HOME) : Get.back();
  }
}
