import 'package:flutter/material.dart';

class CreateNewPasswordCustomPasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;
  final AutovalidateMode autovalidateMode;
  final Function(String)? onChange;

  const CreateNewPasswordCustomPasswordTextField({
    Key? key,
    required this.onChange,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
    this.autovalidateMode = AutovalidateMode.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: controller,
      obscureText: !isPasswordVisible,
      autovalidateMode: autovalidateMode,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
        suffixIcon: IconButton(
          onPressed: onToggleVisibility,
          icon: Icon(
            isPasswordVisible
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
