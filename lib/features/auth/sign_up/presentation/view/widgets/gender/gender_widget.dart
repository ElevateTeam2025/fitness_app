import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_assets.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key,required this.isSelected, required this.onPress, required this.icon, required this.name});

  final bool isSelected;
  final VoidCallback onPress;
  final String icon;
  final String name;

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(

        width: 100.WidthResponsive,
        height: 100.HeightResponsive,
        decoration: BoxDecoration(
          color: widget.isSelected?AppColors.primaryColor:Colors.transparent,
          borderRadius: BorderRadius.circular(95),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(widget.icon),
            Text(widget.name,style: AppTextStyles.BalooThambi2_600_12.copyWith(color: AppColors.whiteColor),),
          ],
        ),
      ),
    );
  }
}
