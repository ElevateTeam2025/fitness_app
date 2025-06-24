import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 1,
      height: 50,
      color: AppColors.greyColor,
    );
  }
}
