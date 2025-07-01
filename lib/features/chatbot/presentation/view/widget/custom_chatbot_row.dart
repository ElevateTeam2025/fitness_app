import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/layout/presentation/manager/layout_cubit/layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomChatbotRow extends StatelessWidget {
  const CustomChatbotRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 14.RadiusResponsive,
          backgroundColor: AppColors.primaryColor,
          child: IconButton(
            onPressed: () {
              BlocProvider.of<LayoutViewModel>(context).currentIndex = 0;
            },
            icon: Image.asset(
              IconAssets.backIcon,
              scale: .8,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hi Ahmed,",
              style: AppTextStyles.BalooThambi2_600_16.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            Text(
              "I am your smart coach",
              style: AppTextStyles.BalooThambi2_600_18.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(IconAssets.menuIcon, scale: 0.9),
        ),
      ],
    );
  }
}
