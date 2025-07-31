// import 'dart:developer';
//
// import 'package:fitness_app/core/common/height_width_extention.dart';
// import 'package:fitness_app/core/utils/app_colors.dart';
// import 'package:fitness_app/features/home/presentation/cubit/workout_cubit/workout_cubit.dart';
// import 'package:fitness_app/features/home/presentation/widget/home_app_bar.dart';
// import 'package:fitness_app/features/home/presentation/widget/home_catagory/home_category_list.dart';
// import 'package:fitness_app/features/home/presentation/widget/row_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// import '../../../../core/utils/app_assets.dart';
// import 'home_catagory/home_sized_box.dart';
// import 'home_catagory/home_workout_widget.dart';
//
//
//
// class HomeTabViewBody extends StatelessWidget {
//   const HomeTabViewBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(ImageAssets.logInBackground),
//             fit: BoxFit.cover,
//           )
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//
//         body: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 16.WidthResponsive,
//            // vertical: 8.HeightResponsive,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: 30,),
//                 HomeAppBAr(firstName: 'hamo', imageUrl: "0"),
//                 HomeSizedBox(),
//                 RowWidget(txt: 'Category', leading_text: '',onPressed: () {  },haveLeadingText: false,),
//                 HomeCategoryList(),
//                 HomeSizedBox(),
//                 RowWidget(txt: 'Recommendation to day', leading_text: '',onPressed: () {  },haveLeadingText: false,),
//                 HomeSizedBox(),
//                 RowWidget(txt: 'Upcoming Workouts', leading_text: 'view all',onPressed: () {  },),
//
//                 YoutubeThumbnail(youtubeUrl: 'https://www.youtube.com/watch?v=5jDEulwWs04', onTap: (){},),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     BlocBuilder<WorkoutCubit, WorkoutState>(
//                       builder: (context, state) {
//                         if (state is WorkoutLoading) {
//                           return Center(
//                             child: CircularProgressIndicator(
//                               color: AppColors.primaryColor,
//                             ),
//                           );
//                         } else if (state is WorkoutSuccess) {
//                           log("${state.exercises.length}");
//                           log(state.exercises[1].exercise);
//
//                           return Expanded(
//                             child: SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children:
//                                 state.exercises.map((cat) {
//                                   return YoutubeThumbnail(
//                                     youtubeUrl: cat.,
//
//
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           );
//                         } else if (state is WorkoutError &&
//                             !state.message.contains("internet")) {
//                           return Center(child: Text(state.message));
//                         } else if (state is WorkoutError &&
//                             state.message.contains("internet")) {
//                           EasyLoading.showError(state.message);
//                         }
//
//                         return const SizedBox.shrink();
//                       },
//                     ),
//                   ],
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//
//
//       ),
//     );
//   }
// }
