import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_practice/food_recipe_app/food_recipe.dart';
import 'package:ui_practice/food_recipe_app/theme/dark_mode.dart';
import 'package:ui_practice/food_recipe_app/theme/light_mode.dart';
import 'package:ui_practice/food_recipe_app/theme/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightMode,
      darkTheme: darkMode,
      home: const FoodRecipe(),
    );
  }
}
