import 'package:flutter/material.dart';

class RichTextProfileWidget extends StatelessWidget {
  final String num;
  final String text;

  const RichTextProfileWidget({Key? key, required this.num, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$num  ',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(color: Colors.black45, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
