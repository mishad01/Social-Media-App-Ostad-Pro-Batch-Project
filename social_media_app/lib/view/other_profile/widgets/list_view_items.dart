import 'package:flutter/material.dart';

class ListViewItems extends StatelessWidget {
  const ListViewItems({
    super.key,
    required this.imageSet,
  });

  final List<String> imageSet;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: imageSet.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imageSet[index],
            fit: BoxFit.contain,
          ),
        );
      },
    ));
  }
}
