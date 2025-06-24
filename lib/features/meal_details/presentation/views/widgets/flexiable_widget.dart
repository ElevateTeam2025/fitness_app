import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/meal_details/domain/entites/meal_details_response_entity.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/custom_info_for_meal_widget.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/meal_details_view_body.dart';
import 'package:flutter/material.dart';

class CustomFlexibleWidget extends StatelessWidget {
  const CustomFlexibleWidget({super.key, required this.data});

  final MealDetailsResponseEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.WidthResponsive),
      height: 344.HeightResponsive,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.RadiusResponsive),
        image: DecorationImage(
          image: NetworkImage(
            data.strMealThumb ??
                'https://www.themealdb.com/images/media/meals/wqqvyq1511179730.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 180.HeightResponsive),
          Text(
            data.strMeal ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.BalooThambi2_500_20.copyWith(
              fontSize: 24.FontSizeResponsive,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 10.HeightResponsive),
          Text(
            data.strInstructions ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.BalooThambi2_400_16.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 10.HeightResponsive),
          SizedBox(
            height: 50.HeightResponsive,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => CustomInfoForMealWidget(),
              separatorBuilder: (context, index) =>
                  SizedBox(width: 20.WidthResponsive),
              itemCount: 4,
            ),
          ),
          // Add more widgets to display meal details
        ],
      ),
    );
  }
}
