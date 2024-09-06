import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ui_practice/food_recipe_app/components/my_drawer.dart';
import 'package:ui_practice/food_recipe_app/theme/theme_provider.dart';

import 'package:ui_practice/food_recipe_app/widget/food_category_view.dart';
import 'package:ui_practice/food_recipe_app/widget/top_view.dart';

class FoodRecipe extends ConsumerWidget {
  const FoodRecipe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  ref.read(themeProvider.notifier).toggleTheme();
                }),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopView(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: FoodCategoryView(),
            ),
          ],
        ),
      ),
    );
  }
}
