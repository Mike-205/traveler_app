import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareTiles extends StatelessWidget {
  final String imagePath;
  const SquareTiles({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
        color: Colors.grey[200]
      ),
      child: Image.asset(
        imagePath,
        height: 25,
      ),
    );
  }
}
