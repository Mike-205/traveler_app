import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final String label;
  var prefixIcon;
  var suffixIcon;
  final bool obscure;

  MyTextField({super.key,
    required this.hint,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    required this.obscure
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue)
          ),

          contentPadding: const EdgeInsets.symmetric(vertical: 15),

          hintText: hint,
          labelText: label,

          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal
          ),
          floatingLabelStyle: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: Colors.grey.shade100,
          filled: true,
        ),
        obscureText: obscure,
      ),
    );
  }
}
