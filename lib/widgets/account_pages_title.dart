import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPagesTitle extends StatelessWidget {
  final String text;
  const AccountPagesTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black87
            ),
          ),
        ],
      ),
    );
  }
}
