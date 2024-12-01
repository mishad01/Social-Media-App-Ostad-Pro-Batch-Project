import 'package:flutter/material.dart';

class RichTextProfileWidget extends StatelessWidget {
  const RichTextProfileWidget({super.key,
    required this.text,
    required this.num});

  final String num;
  final String text;


  @override
  Widget build(BuildContext context) {
    return RichText(
text: TextSpan(
  text:'$num  ',
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 12
  ),

   children: [TextSpan(
     text:  '$text',
     style: TextStyle(
         color: Colors.black45,
         fontSize: 12
     ),


   ) ]
)




    );
  }
}
