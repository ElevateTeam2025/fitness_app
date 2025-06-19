import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, required this.txt, required this.leading_text, required this.onPressed});

  final String txt;
  final String leading_text;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: AppTextStyles.BalooThambi2_600_16.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor
          ),
        ),
        TextButton(
          onPressed: onPressed,

          child: Text(
            leading_text,
            style: AppTextStyles.BalooThambi2_400_14.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
