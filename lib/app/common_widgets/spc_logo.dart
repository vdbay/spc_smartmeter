import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/image_strings.dart';
import '../constants/text_strings.dart';

class SPCLogo extends GetView {
  const SPCLogo({super.key, this.widthModifier = 0.5});
  final double widthModifier;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: SPCTextString.logoTag,
      transitionOnUserGestures: true,
      child: Image.asset(
        SPCImageString.logoPath,
        width: Get.width * widthModifier,
      ),
    );
  }
}
