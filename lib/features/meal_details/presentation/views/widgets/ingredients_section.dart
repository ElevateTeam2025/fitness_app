import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/meal_details/domain/entites/meal_details_response_entity.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/ingredients_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({super.key, required this.data});

  final MealDetailsResponseEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.WidthResponsive),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.HeightResponsive),
          Text(
            S.of(context).ingredients,
            style: AppTextStyles.BalooThambi2_700_20.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 10.HeightResponsive),
          IngredientsWidget(data: data),
        ],
      ),
    );
  }
}
