import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SPCProfileMenu extends GetView {
  const SPCProfileMenu({
    super.key,
    this.onTap,
    required this.leadingIcon,
    required this.text,
    this.trailingIcon = Icons.arrow_forward_ios,
    this.isError = false,
  });
  final Function()? onTap;
  final IconData leadingIcon;
  final String text;
  final IconData trailingIcon;
  final bool? isError;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isError == true ? Get.theme.colorScheme.error : null,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              leadingIcon,
              color: isError == true
                  ? Get.theme.colorScheme.onError
                  : Get.theme.colorScheme.primary,
              size: 36,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: Get.theme.textTheme.bodyMedium?.copyWith(
                color: isError == true
                    ? Get.theme.colorScheme.onError
                    : Get.theme.colorScheme.primary,
              ),
            ),
            const Spacer(),
            Icon(
              trailingIcon,
              size: 36,
              color: isError == true
                  ? Get.theme.colorScheme.onError
                  : Get.theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
