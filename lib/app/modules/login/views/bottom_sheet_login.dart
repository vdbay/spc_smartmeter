import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../localization/hardcoded.dart';
import '../../../modules/otp/controllers/otp_controller.dart';
import '../../../common_widgets/spc_elevatedbutton.dart';
import '../../../common_widgets/spc_numbertextformfield.dart';
import '../../../common_widgets/spc_textformfield.dart';
import '../../../constants/text_strings.dart';
import '../../../utils/spc_utils.dart';
import '../../register/controllers/register_controller.dart';

class BottomSheetLogin {
  const BottomSheetLogin(
      this.email, this.context, this.formKey, this.registerController);
  final String email;
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final RegisterController registerController;
  void showBottomSheetPassword() {
    final passwordController = TextEditingController();
    Get.bottomSheet(
      //   insert password
      Container(
        height: Get.height / 3,
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Insert Password',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              SPCTextFormField(
                controller: passwordController,
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
                labelText: 'Password'.hardcoded,
                hintText: 'Enter your password'.hardcoded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return SPCTextString.emptyPasswordError;
                  }
                  if (SPCUtils.isValidPassword(value)) {
                    return SPCTextString.passwordNotValidError;
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'Forgot Password ?'.hardcoded,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.right,
                    ),
                    onPressed: () {
                      registerController.authRepo.resetPassword(email);
                    },
                  ),
                ],
              ),
              SPCElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      registerController.authRepo.signInMustVerify(
                          email.trim(), passwordController.text.trim());
                    }
                  },
                  text: 'Login'.hardcoded),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  void showBottomOTP() {
    final otpController = Get.put(OtpController());
    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();
    FocusNode focusNode3 = FocusNode();
    FocusNode focusNode4 = FocusNode();
    FocusNode focusNode5 = FocusNode();
    FocusNode focusNode6 = FocusNode();
    Get.bottomSheet(
      //   insert password
      Container(
        height: Get.height / 3,
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Insert OTP'.hardcoded,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: SPCNumberTextFormField(
                        controller: otpController.otpController1,
                        focusNode: focusNode1),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SPCNumberTextFormField(
                        controller: otpController.otpController2,
                        focusNode: focusNode2),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SPCNumberTextFormField(
                        controller: otpController.otpController3,
                        focusNode: focusNode3),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SPCNumberTextFormField(
                        controller: otpController.otpController4,
                        focusNode: focusNode4),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SPCNumberTextFormField(
                        controller: otpController.otpController5,
                        focusNode: focusNode5),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SPCNumberTextFormField(
                      controller: otpController.otpController6,
                      focusNode: focusNode6,
                      isLast: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Hero(
                tag: SPCTextString.login,
                child: SPCElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      otpController.verifyOTP();
                    } else {
                      Get.snackbar(
                          SPCTextString.errorResponse, SPCTextString.otpError,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  text: SPCTextString.verify,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
