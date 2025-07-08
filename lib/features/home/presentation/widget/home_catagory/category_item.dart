import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.imagePath, required this.catName ,  });
 final String imagePath ;
 final String catName ;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 6,),
          Text(catName,
           style:    AppTextStyles.BalooThambi2_400_12.copyWith(color: AppColors.lightWhiteColor)
          )
        ],
      ),
    );
  }
}


