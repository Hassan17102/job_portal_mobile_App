import 'package:flutter/material.dart';
import 'package:intern_task_tracker/utils/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final IconData? icon;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final int maxLines;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.labelText,
    this.icon,
    this.isPassword = false,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.textColor),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: icon != null ? Icon(icon, color: AppTheme.primaryColor) : null,
            // The rest of the styling comes from the InputDecorationTheme in app_theme.dart
          ),
        ),
      ],
    );
  }
}