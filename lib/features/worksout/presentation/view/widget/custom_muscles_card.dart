import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_data_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomMusclesCard extends StatelessWidget {
  const CustomMusclesCard({super.key, required this.muscle});

  final MusclesDataListEntity muscle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PagesRoutes.exercisesWrapperScreen,arguments: muscle.id,);
      },
      child: Container(
        width: 163.WidthResponsive,
        height: 160.HeightResponsive,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:muscle.image == null ?AssetImage(ImageAssets.onboardingBg): NetworkImage(muscle.image ?? ""),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20.RadiusResponsive),
        ),
        child: Text(
          "${muscle.name}",
          textAlign: TextAlign.center,
          style: AppTextStyles.BalooThambi2_600_16.copyWith(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}