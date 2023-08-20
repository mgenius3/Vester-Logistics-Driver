import 'package:flutter/material.dart';
import 'package:vester_driver/common_widgets/button.dart';

class SignInButton extends CustomButton {
  SignInButton({
    String? text,
    Color? textColor,
    Color? bgColor,
    VoidCallback? onPressed,
  }) : super(
            child: Text(text ?? ''),
            color: textColor,
            bgcolor: bgColor,
            onPressed: onPressed);
}
