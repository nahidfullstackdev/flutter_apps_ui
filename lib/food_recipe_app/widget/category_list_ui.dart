// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ui_practice/food_recipe_app/model/food.dart';

class CategoryListUi extends StatefulWidget {
  const CategoryListUi(
      {super.key,
      required this.selectedCategory,
      required this.onCategorySelected});

  final Category selectedCategory;
  final ValueChanged<Category> onCategorySelected;

  @override
  State<CategoryListUi> createState() => _CategoryListUiState();
}

class _CategoryListUiState extends State<CategoryListUi> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> getcategoryNames() {
      return Category.values.map(
        (category) {
          switch (category) {
            case Category.mexican:
              return 'Mexican';
            case Category.chinese:
              return 'Chinese';
            case Category.indian:
              return 'Indian';
            case Category.italian:
              return 'Italian';
            case Category.japanese:
              return 'Japanese';
          }
        },
      ).toList();
    }

    final categories = getcategoryNames();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = Category.values[index];
            final isSelected = selectedIndex == index;
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                widget.onCategorySelected(category);
              },
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 100,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.deepOrange : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.deepOrange),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
