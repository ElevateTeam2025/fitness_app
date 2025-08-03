import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/meal_details/domain/entites/meal_details_response_entity.dart';
import 'package:flutter/material.dart';

class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({
    super.key,
    required this.data,
  });

  final MealDetailsResponseEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.widthResponsive,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerBg,
        borderRadius: BorderRadius.circular(
          20.radiusResponsive,
        ),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => ListTile(
          leading: Text(
            data.strIngredients?[index].name ?? '',
            style:
            AppTextStyles
                .balooThambi2_600_16.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          trailing: Text(
            data.strIngredients?[index].measure ?? '',
            style:
            AppTextStyles
                .balooThambi2_400_12.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          color: AppColors.greyDarkColor,
          height: 1.heightResponsive,
          thickness: 1.heightResponsive,
        ),
        itemCount: data.strIngredients!
            .where((ingredient) {
          return ingredient.name?.isNotEmpty ==
              true &&
              ingredient.measure?.isNotEmpty ==
                  true;
        })
            .toList()
            .length,
      ),
    );
  }
}
