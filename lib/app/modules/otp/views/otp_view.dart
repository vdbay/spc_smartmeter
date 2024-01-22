import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common_widgets/spc_elevatedbutton.dart';
import '../../../common_widgets/spc_logo.dart';
import '../../../common_widgets/spc_numbertextformfield.dart';
import '../../../constants/text_strings.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();
    FocusNode focusNode3 = FocusNode();
    FocusNode focusNode4 = FocusNode();
    FocusNode focusNode5 = FocusNode();
    FocusNode focusNode6 = FocusNode();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: Get.width,
              child: Column(
                children: [
                  const SPCLogo(
                    widthModifier: 0.5,
                  ),
                  Hero(
                    tag: SPCTextString.title,
                    transitionOnUserGestures: true,
                    child: Text(
                      SPCTextString.otpVerification,
                      style: Get.theme.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Hero(
                    tag: SPCTextString.subtitle,
                    transitionOnUserGestures: true,
                    child: Text(
                      SPCTextString.enterOTP,
                      style: Get.theme.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SPCNumberTextFormField(
                                  textController: controller.otpController1,
                                  focusNode: focusNode1),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SPCNumberTextFormField(
                                  textController: controller.otpController2,
                                  focusNode: focusNode2),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SPCNumberTextFormField(
                                  textController: controller.otpController3,
                                  focusNode: focusNode3),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SPCNumberTextFormField(
                                  textController: controller.otpController4,
                                  focusNode: focusNode4),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SPCNumberTextFormField(
                                  textController: controller.otpController5,
                                  focusNode: focusNode5),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SPCNumberTextFormField(
                                textController: controller.otpController6,
                                focusNode: focusNode6,
                                isLast: true,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Hero(
                          tag: SPCTextString.login,
                          child: SPCElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.verifyOTP();
                              } else {
                                Get.snackbar(SPCTextString.errorResponse,
                                    SPCTextString.otpError,
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            },
                            text: SPCTextString.verify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
