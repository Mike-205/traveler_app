import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileIcons extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color color;
  final String text;
  const ProfileIcons({super.key, required this.icon, required this.backgroundColor, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: backgroundColor,
          ),
          child: Icon(
            icon,
            size: 30,
            color: color,
          ),
        ),
        const SizedBox(width: 20,),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500
          )
        ),

        Expanded(child: Container(),),

        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
