import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SPCElevatedButton extends GetView {
  const SPCElevatedButton({
    super.key,
    this.isAlternative = false,
    required this.onPressed,
    required this.text,
    this.widthModifier = 1.0,
    this.backgroundColor,
    this.textColor,
  });

  final bool isAlternative;
  final Function()? onPressed;
  final String text;
  final double widthModifier;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isAlternative ? Get.theme.colorScheme.primary : backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
          width: 2.0,
          color: Get.theme.colorScheme.primary,
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: Get.width * widthModifier,
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isAlternative ? Get.theme.colorScheme.onPrimary : textColor,
          ),
        ),
      ),
    );
  }
}
