import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';

import '../../../../core/router/pages_routes.dart';
import '../../domain/entity/meals_categories_entity.dart';
import 'home_meals_card.dart';

class HomeMealsList extends StatelessWidget {
  final List<HomeMealsCategoriesEntity> meals;
  final bool isLarge ;
  const HomeMealsList({
    super.key,
    required this.meals,  this.isLarge = true,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isLarge ? 104.heightResponsive : 80.heightResponsive,
      child: ListView.builder(
        itemCount:  meals.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, PagesRoutes.mealsCategories,
                  arguments: {
                    'id': index,
                  },
                );
              },
              child: HomeMealsCard (meal: meals[index],isLarge: isLarge,));
        },
      ),
    );
  }
}