import 'package:flutter/material.dart';
import 'package:ui_practice/food_recipe_app/components/food_list.dart';
import 'package:ui_practice/food_recipe_app/model/food.dart';
import 'package:ui_practice/food_recipe_app/screen/food_detail.dart';

import 'package:ui_practice/food_recipe_app/widget/category_list_ui.dart';
import 'package:ui_practice/utils/carousel_view.dart';

class FoodCategoryView extends StatefulWidget {
  const FoodCategoryView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FoodCategoryViewState();
  }
}

class _FoodCategoryViewState extends State<FoodCategoryView> {
  Category selectedCategory = Category.mexican;

  List<Food> get filteredFoodList {
    return foodList
        .where(
          (food) => food.category == selectedCategory,
        )
        .toList();
  }

  void onCategorySelected(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryListUi(
          selectedCategory: selectedCategory,
          onCategorySelected: onCategorySelected,
        ),
        MyCarouselView(
          selectedCategory: selectedCategory,
        ),
      ],
    );
  }
}
