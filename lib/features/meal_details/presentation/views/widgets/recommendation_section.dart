import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/recommendation_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key, required this.args});

  final List args;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).recommendation,
            style: AppTextStyles.BalooThambi2_700_20.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 10.heightResponsive),
          RecommendationWidget(args: args),
          SizedBox(height: 10.heightResponsive),
        ],
      ),
    );
  }
}
