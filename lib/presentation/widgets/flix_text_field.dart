import 'package:flutter/material.dart';

class FlixTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final bool obscureText;

  const FlixTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
  });

  // const FlixTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
