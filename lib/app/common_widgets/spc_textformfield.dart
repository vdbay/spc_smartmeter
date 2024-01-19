import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SPCTextFormField extends GetView {
  const SPCTextFormField(
      {super.key,
      this.isPassword = false,
      this.prefixIcon,
      required this.labelText,
      required this.hintText,
      this.validator,
      this.focusNode,
      this.textInputAction,
      this.keyboardType,
      this.textController,
      this.readOnly = false});
  final bool isPassword;
  final Widget? prefixIcon;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? textController;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    final RxBool isObscured = isPassword.obs;
    return Obx(() => TextFormField(
          readOnly: readOnly,
          controller: textController,
          focusNode: focusNode,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          obscureText: isObscured.value,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      isObscured.value = !isObscured.value;
                    },
                    icon: Icon(
                      isObscured.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ))
                : null,
            labelText: labelText,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: validator,
        ));
  }
}
