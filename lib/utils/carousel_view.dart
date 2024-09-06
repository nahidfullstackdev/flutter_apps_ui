// my_carousel_view.dart
import 'package:flutter/material.dart';
import 'package:ui_practice/food_recipe_app/components/food_list.dart';
import 'package:ui_practice/food_recipe_app/model/food.dart';
import 'package:ui_practice/food_recipe_app/screen/food_detail.dart';

class MyCarouselView extends StatefulWidget {
  const MyCarouselView({
    super.key,
    required this.selectedCategory,
  });

  final Category selectedCategory;

  @override
  State<MyCarouselView> createState() => _MyCarouselViewState();
}

class _MyCarouselViewState extends State<MyCarouselView> {
  Future<List<Food>> _fetchFoodList() async {
    // Simulate a network call or data fetch
    await Future.delayed(
      const Duration(seconds: 1),
    ); // Simulate loading delay

    // Filter foodList based on the selected category
    return foodList
        .where((food) => food.category == widget.selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return SizedBox(
      height: screenSize.height / 1.5,
      width: screenSize.width,
      child: FutureBuilder<List<Food>>(
        future: _fetchFoodList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while data is being fetched
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Handle error
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final foodList = snapshot.data!;
            return CarouselView(
              itemExtent: screenSize.width - 90,
              itemSnapping: true,
              children: List.generate(
                foodList.length,
                (index) {
                  return Column(
                    children: [
                      Expanded(
                        child: Hero(
                          tag: foodList[index].image,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              foodList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          foodList[index].name,
                          style: TextStyle(
                            color: theme.colorScheme.inverseSurface,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              onTap: (index) => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FoodDetail(food: foodList[index]),
              )),
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
