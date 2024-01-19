import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/text_strings.dart';

class SPCUtils {
  static String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return SPCTextString.morningGreetings;
    }
    if (hour < 17) {
      return SPCTextString.afternoonGreetings;
    }
    return SPCTextString.eveningGreetings;
  }

  static String greetingWithName(String name) {
    return "${greeting()}, $name !";
  }

  static bool isValidFullName(String fullName) {
    return RegExp(r"^[A-Z]([a-zA-Z]|\.| |-|')+$").hasMatch(fullName);
  }

  static String phoneFormatter(String phone) {
    if (phone.startsWith('08')) {
      // if phone starts with 08, remove the 0 and add +62
      phone = '+62${phone.substring(1)}';
    } else if (phone.startsWith('8')) {
      // if phone starts with 8, add +62
      phone = '+62$phone';
    } else if (phone.startsWith('62')) {
      // if phone starts with 62, add +
      phone = '+$phone';
    }
    // else, the phone is already in the correct format
    return phone;
  }

  static bool isValidPassword(String password) {
    // Minimum eight characters, at least one uppercase letter, one lowercase letter and one number
    return RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
        .hasMatch(password);
  }

  static void showSnackbar(String title, String message,
      {int type = 4, SnackPosition position = SnackPosition.BOTTOM}) {
    Get.isSnackbarOpen ? Get.back() : null;
    // type 1: success, type 2: error, type 3: warning, type 4: info (default)
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      backgroundColor: type == 1
          ? Colors.green
          : type == 2
              ? Colors.red
              : type == 3
                  ? Colors.orange
                  : Colors.blue,
      colorText: Colors.white,
      icon: Icon(
        type == 1
            ? Icons.check_circle_outline
            : type == 2
                ? Icons.error_outline
                : type == 3
                    ? Icons.warning_amber_outlined
                    : Icons.info_outline,
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
