import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meal_grid_view_item.dart';
import 'package:flutter/material.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({super.key, required this.args});

  final List args;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.heightResponsive,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: args[1].length,
        itemBuilder: (context, index) =>
            MealGridViewItem(meal: args[1][index], meals: args[1]),
        separatorBuilder: (context, index) =>
            SizedBox(width: 10.widthResponsive),
      ),
    );
  }
}
