import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint; // holds the labelText of the TextField
  final TextEditingController controller;

  const MyTextField({required this.controller, required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 20),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelStyle: const TextStyle(fontSize: 18),
        border: const OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }
}
