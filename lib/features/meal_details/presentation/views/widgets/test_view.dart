import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(ImageAssets.mealDetailsBg, fit: BoxFit.cover),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.widthResponsive),
          height: 344.heightResponsive,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.radiusResponsive),
            image: DecorationImage(
              image: NetworkImage(
                'https://www.themealdb.com/images/media/meals/wqqvyq1511179730.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 180.heightResponsive),
              Text(
                'Pasta with meat',
                style: AppTextStyles.balooThambi2_500_20.copyWith(
                  fontSize: 24.fontSizeResponsive,
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: 10.heightResponsive),

              Text(
                'Lorem ipsum dolor sit amet consectetur. Tempus volutpat ut nisi morbi. ',
                style: AppTextStyles.balooThambi2_400_16.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: 10.heightResponsive),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.widthResponsive,
                      vertical: 4.heightResponsive,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20.radiusResponsive),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '100 k',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Text(
                          'Energy',
                          style: AppTextStyles.BalooThambi2_700_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.widthResponsive,
                      vertical: 4.heightResponsive,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20.radiusResponsive),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '100 k',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Text(
                          'Energy',
                          style: AppTextStyles.BalooThambi2_700_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.widthResponsive,
                      vertical: 4.heightResponsive,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20.radiusResponsive),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '100 k',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Text(
                          'Energy',
                          style: AppTextStyles.BalooThambi2_700_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.widthResponsive,
                      vertical: 4.heightResponsive,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20.radiusResponsive),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '100 k',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Text(
                          'Energy',
                          style: AppTextStyles.BalooThambi2_700_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Add more widgets to display meal details
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 330.heightResponsive),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.heightResponsive),
                Text(
                  'Ingredients',
                  style: AppTextStyles.BalooThambi2_700_20.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 10.heightResponsive),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.containerBg,
                    borderRadius: BorderRadius.circular(20.radiusResponsive),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(
                          'Meal Breasts',
                          style: AppTextStyles.balooThambi2_600_16.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        trailing: Text(
                          '250g',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Meal Breasts',
                          style: AppTextStyles.balooThambi2_600_16.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        trailing: Text(
                          '250g',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Meal Breasts',
                          style: AppTextStyles.balooThambi2_600_16.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        trailing: Text(
                          '250g',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Meal Breasts',
                          style: AppTextStyles.balooThambi2_600_16.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        trailing: Text(
                          '250g',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Meal Breasts',
                          style: AppTextStyles.balooThambi2_600_16.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        trailing: Text(
                          '250g',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Meal Breasts',
                          style: AppTextStyles.balooThambi2_600_16.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        trailing: Text(
                          '250g',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Meal Breasts',
                          style: AppTextStyles.balooThambi2_600_16.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        trailing: Text(
                          '250g',
                          style: AppTextStyles.balooThambi2_400_12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Stack(
//     children: [
//       SizedBox.expand(
//         child: Image.asset(ImageAssets.mealDetailsBg, fit: BoxFit.cover),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(horizontal: 20.WidthResponsive),
//         height: 344.HeightResponsive,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.RadiusResponsive),
//           image: DecorationImage(
//             image: NetworkImage(
//               'https://www.themealdb.com/images/media/meals/wqqvyq1511179730.jpg',
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 180.HeightResponsive),
//             Text(
//               'Pasta with meat',
//               style: AppTextStyles.BalooThambi2_500_20.copyWith(
//                 fontSize: 24.FontSizeResponsive,
//                 color: AppColors.whiteColor,
//               ),
//             ),
//             SizedBox(height: 10.HeightResponsive),
//
//             Text(
//               'Lorem ipsum dolor sit amet consectetur. Tempus volutpat ut nisi morbi. ',
//               style: AppTextStyles.BalooThambi2_400_16.copyWith(
//                 color: AppColors.whiteColor,
//               ),
//             ),
//             SizedBox(height: 10.HeightResponsive),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 8.WidthResponsive,
//                     vertical: 4.HeightResponsive,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.greyColor),
//                     borderRadius: BorderRadius.circular(20.RadiusResponsive),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         '100 k',
//                         style: AppTextStyles.BalooThambi2_400_12.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       Text(
//                         'Energy',
//                         style: AppTextStyles.BalooThambi2_700_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 8.WidthResponsive,
//                     vertical: 4.HeightResponsive,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.greyColor),
//                     borderRadius: BorderRadius.circular(20.RadiusResponsive),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         '100 k',
//                         style: AppTextStyles.BalooThambi2_400_12.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       Text(
//                         'Energy',
//                         style: AppTextStyles.BalooThambi2_700_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 8.WidthResponsive,
//                     vertical: 4.HeightResponsive,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.greyColor),
//                     borderRadius: BorderRadius.circular(20.RadiusResponsive),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         '100 k',
//                         style: AppTextStyles.BalooThambi2_400_12.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       Text(
//                         'Energy',
//                         style: AppTextStyles.BalooThambi2_700_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 8.WidthResponsive,
//                     vertical: 4.HeightResponsive,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.greyColor),
//                     borderRadius: BorderRadius.circular(20.RadiusResponsive),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         '100 k',
//                         style: AppTextStyles.BalooThambi2_400_12.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       Text(
//                         'Energy',
//                         style: AppTextStyles.BalooThambi2_700_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // Add more widgets to display meal details
//           ],
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.only(top: 330.HeightResponsive),
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: 16.WidthResponsive,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 30.HeightResponsive),
//               Text(
//                 'Ingredients',
//                 style: AppTextStyles.BalooThambi2_700_20.copyWith(
//                   color: AppColors.whiteColor,
//                 ),
//               ),
//               SizedBox(height: 10.HeightResponsive),
//               Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.containerBg,
//                   borderRadius: BorderRadius.circular(
//                     20.RadiusResponsive,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       leading: Text(
//                         'Meal Breasts',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_600_16.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       trailing: Text(
//                         '250g',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_400_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text(
//                         'Meal Breasts',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_600_16.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       trailing: Text(
//                         '250g',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_400_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text(
//                         'Meal Breasts',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_600_16.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       trailing: Text(
//                         '250g',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_400_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text(
//                         'Meal Breasts',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_600_16.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       trailing: Text(
//                         '250g',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_400_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text(
//                         'Meal Breasts',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_600_16.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       trailing: Text(
//                         '250g',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_400_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text(
//                         'Meal Breasts',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_600_16.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       trailing: Text(
//                         '250g',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_400_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Text(
//                         'Meal Breasts',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_600_16.copyWith(
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       trailing: Text(
//                         '250g',
//                         style:
//                         AppTextStyles
//                             .BalooThambi2_400_12.copyWith(
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }
///////////////////////////////////////////////////////////////////
// @override
// Widget build(BuildContext context) {
//   return CustomScrollView(
//     slivers: [
//       SliverAppBar(
//         toolbarHeight: 70.HeightResponsive,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.primaryColor,
//                 borderRadius: BorderRadius.circular(50.RadiusResponsive),
//               ),
//               child: IconButton(
//                 icon: Image.asset(
//                   IconAssets.backIcon,
//                   height: 30.HeightResponsive,
//                   width: 30.WidthResponsive,
//                 ),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//           ],
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(0.HeightResponsive),
//           child: Container(
//             color: AppColors.whiteColor,
//             width: double.maxFinite,
//             padding: EdgeInsets.only(
//               top: 5.WidthResponsive,
//               bottom: 10.HeightResponsive,
//             ),
//             child: Center(child: Text('MEAL Title')),
//           ),
//         ),
//         pinned: true,
//         backgroundColor: AppColors.primaryColor,
//         expandedHeight: 300.HeightResponsive,
//         flexibleSpace: FlexibleSpaceBar(
//           background: Image.network(
//             'https://www.themealdb.com/images/media/meals/wqqvyq1511179730.jpg',
//             width: double.maxFinite,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       SliverToBoxAdapter(
//         child: Text(
//           "Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief,Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.Contrary to popular belief, Lorem Ipsum is not simply random text.",
//         ),
//       ),
//     ],
//   );
// }

////
// ListTile(
// leading: Text(
// 'Meal Breasts',
// style:
// AppTextStyles
//     .BalooThambi2_600_16.copyWith(
// color: AppColors.whiteColor,
// ),
// ),
// trailing: Text(
// '250g',
// style:
// AppTextStyles
//     .BalooThambi2_400_12.copyWith(
// color: AppColors.primaryColor,
// ),
// ),
// ),
