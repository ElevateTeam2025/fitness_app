import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class VerifyResetCodeTopLeftTitle extends StatelessWidget {
  const VerifyResetCodeTopLeftTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.WidthResponsive),
          child: Text(
            'OTP CODE',
            style: AppTextStyles.BalooThambi2_800_20.copyWith(
              color: Colors.white,
              height: (140 ~/ 100).HeightResponsive,
            ),
          ),
        ),
        SizedBox(height: 5.HeightResponsive),
        Padding(
          padding: EdgeInsets.only(left: 16.WidthResponsive),
          child: Text(
            'Enter Your OTP Check Your Email',
            style: AppTextStyles.BalooThambi2_400_18.copyWith(
              color: Colors.white,
              height: (140 ~/ 100).HeightResponsive,
            ),
          ),
        ),
      ],
    );
  }
}
