import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class ForgetPasswordTopLeftTitle extends StatelessWidget {
  const ForgetPasswordTopLeftTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.widthResponsive),
          child: Text(
            S.of(context).enterYourEmail,
            style: AppTextStyles.balooThambi2_400_18.copyWith(
              color: Colors.white,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 16.widthResponsive),
          child: Text(
            'Forget Password',
            style: AppTextStyles.BalooThambi2_800_20.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
