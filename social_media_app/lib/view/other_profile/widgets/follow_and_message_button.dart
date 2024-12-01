import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FollowAndMessageButton extends StatelessWidget {
  const FollowAndMessageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilledButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(59, 30),
              backgroundColor: Color(0xffEAECF0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
          child: Text('Follow',
              style: TextStyle(fontSize: 12, color: Colors.black)),
        ),
        SizedBox(width: 3.w),
        FilledButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(59, 30),
              backgroundColor: Color(0xffEAECF0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
          child: Text('Message',
              style: TextStyle(fontSize: 12, color: Colors.black)),
        )
      ],
    );
  }
}
