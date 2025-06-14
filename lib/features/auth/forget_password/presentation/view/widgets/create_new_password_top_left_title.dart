import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordTopLeftTitle extends StatelessWidget {
  const CreateNewPasswordTopLeftTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.WidthResponsive),
          child: Text(
            'Make Sure Its 8 Characters Or More',
            style: AppTextStyles.BalooThambi2_400_18.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.WidthResponsive),
          child: Text(
            'Create New Password',
            style: AppTextStyles.BalooThambi2_800_20.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
