import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/text_styles.dart';

class BuildPageTitle extends StatelessWidget {
  const BuildPageTitle({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.WidthResponsive),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.BalooThambi2_800_20.copyWith(
                  color: Colors.white,
                ),
              ),

              Text(
                subTitle,
                style: AppTextStyles.BalooThambi2_400_18.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
