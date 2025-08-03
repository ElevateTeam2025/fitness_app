import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditLabelTextWidget extends StatelessWidget {
  const EditLabelTextWidget({
    super.key,
    required this.label,
    required this.onTap,
  });
  final String label;
  final VoidCallback onTap;
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: AppTextStyles.balooThambi2_600_14.copyWith(
              color: Colors.white,
            ),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: '(',
            style: AppTextStyles.balooThambi2_600_14.copyWith(
              color: Colors.white,
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                'tap To Edit',
                style: AppTextStyles.balooThambi2_600_14.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          TextSpan(
            text: ')',
            style: AppTextStyles.balooThambi2_600_14.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
