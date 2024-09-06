import 'package:flutter/material.dart';
import 'package:ui_practice/food_recipe_app/model/food.dart';
import 'package:ui_practice/food_recipe_app/widget/middle_card_of_food_details.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({
    super.key,
    required this.food,
  });
  final Food food;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image with hero
            SizedBox(
              height: screenSize.height / 1.8,
              child: Stack(
                children: [
                  Hero(
                    tag: food.image,
                    child: SizedBox(
                      height: screenSize.height / 2,
                      width: screenSize.width,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Image.asset(
                          food.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: MiddleCardOfFoodDetails(foodname: food.name),
                  )
                ],
              ),
            ),

            ///////////////////////////////////////

            // texts
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                '${food.name} Recipe',
                style: TextStyle(
                    color: theme.colorScheme.inverseSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry/s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                    color: theme.colorScheme.inverseSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
