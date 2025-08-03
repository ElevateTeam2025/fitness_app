import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';
import 'package:flutter/material.dart';

class MealGridViewItem extends StatelessWidget {
  const MealGridViewItem({super.key, required this.meal,  this.meals});

  final MealsByCategoryEntity meal;
  final List<MealsByCategoryEntity>? meals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          PagesRoutes.mealDetails,
          arguments: [meal.idMeal, meals],
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.radiusResponsive),
        child: Container(
          padding: EdgeInsets.all(8.widthResponsive),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(meal.strMealThumb!),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35),
                BlendMode.darken,
              ),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              meal.strMeal!,
              textAlign: TextAlign.center,
              style: AppTextStyles.BalooThambi2_700_16.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
