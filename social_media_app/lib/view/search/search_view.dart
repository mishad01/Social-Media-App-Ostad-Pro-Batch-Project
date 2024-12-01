import 'package:flutter/material.dart';
import 'package:social_media_app/view/search/widgets/custom_search_field.dart';


class AssetsPath {
  static String getImagePath(int index) {
    return 'assets/images/image_${index + 1}.png'; // Adjust the path to your assets
  }
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomSearchField(), // Ensure CustomSearchField widget exists
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(8.0), // Padding for the entire grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                ),
                itemBuilder: (context, index) {
                  String imagePath = AssetsPath.getImagePath(index); // Get dynamic image path
                  return Padding(
                    padding: const EdgeInsets.all(8.0), // Padding for each item inside the grid
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: 10,
              ),
          ),

        ],
      ),
    );
  }
}
