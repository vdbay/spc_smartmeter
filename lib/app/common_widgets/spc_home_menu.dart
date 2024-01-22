import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SPCHomeMenu extends GetView {
  const SPCHomeMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  });
  final Icon icon;
  final String title;
  final String description;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        color: Get.theme.colorScheme.primary,
        child: Row(
          children: [
            Container(
              width: Get.width * 0.25,
              padding: const EdgeInsets.all(10),
              color: Get.theme.colorScheme.onPrimary,
              child: Column(
                children: [
                  icon,
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: Get.theme.textTheme.bodyMedium?.copyWith(
                      color: Get.theme.colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                description,
                maxLines: 6,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: Get.theme.textTheme.bodyMedium?.copyWith(
                  color: Get.theme.colorScheme.onPrimary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
