import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

import '../../../common_widgets/spc_elevatedbutton.dart';
import '../../../common_widgets/spc_logo.dart';
import '../../../constants/text_strings.dart';
import '../controllers/landing_controller.dart';
import '../../../localization/hardcoded.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SPCLogo(
                widthModifier: 0.8,
              ),
              Column(
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: SPCTextString.title,
                    child: Text(
                      SPCTextString.spcLong,
                      style: Get.theme.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Hero(
                    transitionOnUserGestures: true,
                    tag: SPCTextString.subtitle,
                    child: Text(
                      'Over 20 years of experience'.hardcoded,
                      style: Get.theme.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Hero(
                        tag: SPCTextString.login,
                        child: SPCElevatedButton(
                          widthModifier: 0.25,
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                          text: SPCTextString.login,
                        ),
                      ),
                      Hero(
                        tag: SPCTextString.signUp,
                        child: SPCElevatedButton(
                          isAlternative: true,
                          widthModifier: 0.25,
                          onPressed: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          text: SPCTextString.signUp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
