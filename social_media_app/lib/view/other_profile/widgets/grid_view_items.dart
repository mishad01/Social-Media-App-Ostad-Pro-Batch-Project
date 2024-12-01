import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    super.key,
    required this.imageSet,
  });

  final List<String> imageSet;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MasonryGridView.builder(
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imageSet[index],
            fit: BoxFit.contain,
          ),
        ),
        itemCount: imageSet.length,
      ),
    );
  }
}
