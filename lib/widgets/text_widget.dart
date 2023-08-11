import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.type,
    this.onChanged
  });
  final String label;
  final TextEditingController controller;
  final TextInputType type;
 final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged:onChanged ,
      keyboardType: type,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
      ),
    );
  }
}
