import 'package:flutter/material.dart';
import '../screens/consts/consts.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;

  const CustomTextField({super.key, required this.labelText, required TextEditingController controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: textFieldDecoration(labelText),
    );
  }
}

InputDecoration textFieldDecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: const TextStyle(color: kItesoBlueStrong),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}
