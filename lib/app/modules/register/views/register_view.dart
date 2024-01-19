import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spc_smartmeter/app/routes/app_pages.dart';

import '../../../common_widgets/spc_elevatedbutton.dart';
import '../../../common_widgets/spc_logo.dart';
import '../../../common_widgets/spc_textformfield.dart';
import '../../../constants/text_strings.dart';
import '../../../utils/spc_utils.dart';
import '../../user/models/user_model.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode nameFocusNode = FocusNode();
    final FocusNode phoneFocusNode = FocusNode();
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
                      SPCTextString.getStarted,
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Hero(
                    tag: SPCTextString.subtitle,
                    transitionOnUserGestures: true,
                    child: Text(
                      SPCTextString.createAccount,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        SPCTextFormField(
                          controller: controller.nameController,
                          focusNode: nameFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          prefixIcon: const Icon(Icons.person),
                          labelText: SPCTextString.name,
                          hintText: SPCTextString.nameHint,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return SPCTextString.emptyNameError;
                            }
                            if (!SPCUtils.isValidFullName(value)) {
                              return SPCTextString.nameNotValidError;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Hero(
                          tag: SPCTextString.email,
                          child: Material(
                            type: MaterialType.transparency,
                            child: SPCTextFormField(
                              controller: controller.emailController,
                              focusNode: emailFocusNode,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: const Icon(Icons.email),
                              labelText: SPCTextString.email,
                              hintText: SPCTextString.emailHint,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return SPCTextString.emptyEmailError;
                                } else if (!GetUtils.isEmail(value)) {
                                  return SPCTextString.emailNotValidError;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SPCTextFormField(
                          controller: controller.phoneController,
                          focusNode: phoneFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          prefixIcon: const Icon(Icons.phone),
                          labelText: SPCTextString.phone,
                          hintText: SPCTextString.phoneHint,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return SPCTextString.emptyPhoneError;
                            } else if (!GetUtils.isPhoneNumber(value)) {
                              return SPCTextString.phoneNotValidError;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: Get.width,
                          child: Hero(
                            tag: SPCTextString.signUp,
                            child: SPCElevatedButton(
                              isAlternative: true,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (formKey.currentState!.validate()) {
                                    var phone =
                                        controller.phoneController.text.trim();
                                    phone = SPCUtils.phoneFormatter(phone);
                                    controller.createUser(UserModel(
                                      name:
                                          controller.nameController.text.trim(),
                                      email: controller.emailController.text
                                          .trim(),
                                      phone: phone,
                                    ));
                                    Get.toNamed(Routes.OTP);
                                  }
                                }
                              },
                              text: SPCTextString.signUp,
                            ),
                          ),
                        ),
                      ],
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
                            SPCTextString.haveAnAccount,
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              SPCTextString.login,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
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
