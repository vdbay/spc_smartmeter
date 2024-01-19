import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SPCNumberTextFormField extends GetView {
  const SPCNumberTextFormField({
    super.key,
    required this.focusNode,
    this.isLast = false,
    required this.textController,
  });
  final FocusNode focusNode;
  final bool isLast;
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return '';
        }
        return null;
      },
      controller: textController,
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        } else if (value.isEmpty) {
          FocusScope.of(context).previousFocus();
        } else {
          textController.text = value.substring(0, 1);
        }
      },
      textAlign: TextAlign.center,
      focusNode: focusNode,
      textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      keyboardType: TextInputType.number,
      maxLength: 1,
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
