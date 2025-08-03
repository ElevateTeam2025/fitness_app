import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, required this.txt, required this.leadingText,
    required this.onPressed, this.haveLeadingText=true});

  final String txt;
  final String leadingText;
  final VoidCallback onPressed;
  final bool haveLeadingText;


  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: AppTextStyles.balooThambi2_600_16.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor
          ),
        ),
        haveLeadingText?
        TextButton(
          onPressed: onPressed,

          child: Text(
            leadingText,
            style: AppTextStyles.balooThambi2_400_14.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.primaryColor,
            ),
          ),
        ):SizedBox(),
      ],
    );
  }
}
