import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../generated/l10n.dart';

class HomeAppBAr extends StatelessWidget {

   HomeAppBAr({super.key, required this.firstName, required this.imageUrl});
 final  String firstName;
 final  String imageUrl;
  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
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
              Text("${tr.hi} $firstName ,",
              style: AppTextStyles.BalooThambi2_500_16.copyWith(color: AppColors.whiteColor),
              ),
              SizedBox(height:  3.HeightResponsive,),
              Text(tr.LetStartDay,
                style: AppTextStyles.BalooThambi2_500_18.copyWith(color: AppColors.whiteColor),
              ),
            ],
          ),
          Container(
            width: 36.WidthResponsive,
            height: 36.HeightResponsive,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : const AssetImage(ImageAssets.logo) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
