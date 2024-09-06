import 'package:flutter/material.dart';

class MiddleCardOfFoodDetails extends StatelessWidget {
  const MiddleCardOfFoodDetails({super.key, required this.foodname});

  final String foodname;

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    return Container(
      height: 100,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            foodname,
            style: TextStyle(
                color: theme.colorScheme.inverseSurface,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          //
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.people),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '2.2k',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star_border),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '8.0',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.line_axis),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '80%',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
