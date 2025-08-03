import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class CreateNewPasswordTopLeftTitle extends StatelessWidget {
  const CreateNewPasswordTopLeftTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.widthResponsive),
          child: Text(
            S.of(context).sureCharacters,
            style: AppTextStyles.balooThambi2_400_18.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.widthResponsive),
          child: Text(
            S.of(context).createNewPassword,
            style: AppTextStyles.BalooThambi2_800_20.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
