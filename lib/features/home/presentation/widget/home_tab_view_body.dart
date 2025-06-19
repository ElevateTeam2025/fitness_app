import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/home/presentation/widget/home_app_bar.dart';
import 'package:fitness_app/features/home/presentation/widget/home_catagory/home_category_list.dart';
import 'package:fitness_app/features/home/presentation/widget/row_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import 'home_catagory/home_sized_box.dart';



class HomeTabViewBody extends StatelessWidget {
  const HomeTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.logInBackground),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.WidthResponsive,
           // vertical: 8.HeightResponsive,
          ),
          child: Column(
            children: [
              SizedBox(height: 30,),
              HomeAppBAr(firstName: 'hamo', imageUrl: "0"),
              HomeSizedBox(),
              RowWidget(txt: 'Category', leading_text: '',onPressed: () {  },),
              HomeCategoryList(),
              HomeSizedBox(),
              RowWidget(txt: 'Recommendation to day', leading_text: '',onPressed: () {  },),

            ],
          ),
        ),


      ),
    );
  }
}
