import 'package:flutter/material.dart';

import '../utils/textfield_styles.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasAsteriks;

  const LoginTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.hasAsteriks =false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAsteriks,
      validator: (value) {
        if (value != null) return validator!(value);
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: ThemeTextStyle.loginTextFieldStyle,
        border: OutlineInputBorder(),
      ),
    );
  }
}
