import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FormInput extends StatelessWidget {
  final String id;
  final TextInputType keyboardType;
  final String label;
  final String placeholder;
  final String? description;
  final String? Function(String) validator;
  final IconData icon;
  final Widget? sufix;
  final bool obscureText;

  const FormInput({
    super.key,
    required this.id,
    required this.keyboardType,
    required this.label,
    required this.placeholder,
    this.description,
    required this.validator,
    required this.icon,
    this.sufix,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
        obscureText: obscureText,
        id: id,
        keyboardType: keyboardType,
        label: Text(label),
        placeholder: Text(placeholder),
        description: description != null ? Text(description!) : null,
        validator: validator,
        prefix: Padding(
          padding: EdgeInsets.all(4.0),
          child: ShadImage.square(size: 16, icon),
        ),
        suffix: sufix);
  }
}
