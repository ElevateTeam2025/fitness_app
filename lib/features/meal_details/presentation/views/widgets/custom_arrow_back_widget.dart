import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomArrowBackWidget extends StatelessWidget {
  const CustomArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(50.RadiusResponsive),
          ),
          child: IconButton(
            icon: Image.asset(
              IconAssets.backIcon,
              height: 30.HeightResponsive,
              width: 30.WidthResponsive,
            ),
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              PagesRoutes.mealsCategories,
            ),
          ),
        ),
      ],
    );
  }
}
