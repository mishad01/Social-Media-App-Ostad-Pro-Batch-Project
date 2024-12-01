import 'package:flutter/material.dart';

class RichTextProfile extends StatelessWidget {
  const RichTextProfile({
    super.key,
    required this.num,
    required this.text,
  });
  final String num;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$num ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
