import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        height: 40,
        width: double.infinity, // Adjusted for responsiveness
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Search',
            labelStyle:
                TextStyle(color: Color(0xff98A2B3)), // Fixed property name
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xff6993FF),
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff475467),
            ),
          ),
        ),
      ),
    );
  }
}
