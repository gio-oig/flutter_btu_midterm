import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {Key? key, required this.controller, required this.inputType, this.hint})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some value';
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            isDense: true,
            border: const OutlineInputBorder(),
            hintText: hint),
      ),
    );
  }
}
