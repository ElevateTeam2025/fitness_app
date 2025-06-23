import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class HomeAppBAr extends StatelessWidget {

   HomeAppBAr({super.key, required this.firstName, required this.imageUrl});
 final  String firstName;
 final  String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.WidthResponsive,
        // vertical: 8.HeightResponsive,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              SizedBox(height:  16.HeightResponsive,),
              Text("Hi $firstName ,",
              style: AppTextStyles.BalooThambi2_500_16.copyWith(color: AppColors.whiteColor),
              ),
              SizedBox(height:  3.HeightResponsive,),
              Text("Let’s start your day",
                style: AppTextStyles.BalooThambi2_500_18.copyWith(color: AppColors.whiteColor),
              ),
            ],
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.whiteColor, // لون الدائرة
              shape: BoxShape.circle,
            ),

          )

        ],
      ),
    );
  }
}
