import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hint;
  final String label;
  var prefixIcon;
  final bool isPassword;
  bool obscured;
  final controller;

  MyTextField({super.key,
    required this.hint,
    required this.label,
    required this.prefixIcon,
    required this.isPassword,
    this.obscured = true,
    required this.controller
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue)
          ),

          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),

          hintText: widget.hint,
          labelText: widget.label,

          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal
          ),
          floatingLabelStyle: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword == true? IconButton(
            onPressed: () {
              setState(() {
                widget.obscured = !widget.obscured;
              });
            },
            icon: Icon(
              widget.obscured == true? Icons.visibility_off : Icons.visibility,
              size: 25,
              color: const Color(0xFF809fff),
            ),
          ) : null,
          fillColor: Colors.grey.shade100,
          filled: true,
        ),
        obscureText: widget.obscured,
      ),
    );
  }
}
