import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  var fontweight;

  AppText({super.key,
    this.fontweight,
    this.size=20,
    required this.text,
    this.color=Colors.black54
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontweight
      ),
    );
  }
}
