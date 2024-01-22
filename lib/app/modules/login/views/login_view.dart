import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spc_smartmeter/app/routes/app_pages.dart';

import '../../../localization/hardcoded.dart';
import '../../../common_widgets/spc_elevatedbutton.dart';
import '../../../common_widgets/spc_logo.dart';
import '../../../common_widgets/spc_textformfield.dart';
import '../../../constants/text_strings.dart';
import '../../register/controllers/register_controller.dart';
import '../controllers/login_controller.dart';
import './bottom_sheet_login.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final registerController = Get.put(RegisterController());
    TextEditingController phoneController = TextEditingController();
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
                      SPCTextString.welcome,
                      style: Get.theme.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Hero(
                    tag: SPCTextString.subtitle,
                    transitionOnUserGestures: true,
                    child: Text(
                      SPCTextString.loginSubtitle,
                      style: Get.theme.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Hero(
                          tag: SPCTextString.email,
                          child: Material(
                            type: MaterialType.transparency,
                            child: SPCTextFormField(
                              textController: phoneController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'Email or Phone No'.hardcoded,
                              hintText:
                                  'Enter your email or phone no'.hardcoded,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return SPCTextString.emptyPhoneError;
                                }
                                if (!GetUtils.isPhoneNumber(value) &&
                                    !GetUtils.isEmail(value)) {
                                  return 'Please enter a valid email or phone no'
                                      .hardcoded;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Hero(
                          tag: SPCTextString.login,
                          child: SPCElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (GetUtils.isPhoneNumber(
                                    phoneController.text.trim())) {
                                  registerController
                                      .phoneAuth(phoneController.text.trim());
                                  BottomSheetLogin(phoneController.text.trim(),
                                          context, formKey, registerController)
                                      .showBottomOTP();
                                }
                                if (GetUtils.isEmail(
                                    phoneController.text.trim())) {
                                  BottomSheetLogin(phoneController.text.trim(),
                                          context, formKey, registerController)
                                      .showBottomSheetPassword();
                                }
                              }
                            },
                            text: SPCTextString.login,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Hero(
                          tag: SPCTextString.already,
                          child: Material(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  SPCTextString.dontHaveAnAccount,
                                  textAlign: TextAlign.center,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.offNamed(Routes.REGISTER);
                                  },
                                  child: Text(
                                    SPCTextString.signUp,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Get.theme.colorScheme.primary),
                                  ),
                                ),
                              ],
                            ),
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
