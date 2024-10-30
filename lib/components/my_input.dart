import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String text;
  final bool obscureText;
  final TextEditingController controller;
  const MyInput({super.key, required this.text, required this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: text,
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Theme.of(context).colorScheme.primary
          )
        ),
      ),
    );
  }
}