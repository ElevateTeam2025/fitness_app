import 'dart:developer';

import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/home/presentation/widget/home_app_bar.dart';
import 'package:fitness_app/features/home/presentation/widget/home_catagory/home_category_list.dart';
import 'package:fitness_app/features/home/presentation/widget/home_catagory/home_sized_box.dart';
import 'package:fitness_app/features/home/presentation/widget/home_meals_list.dart';
import 'package:fitness_app/features/home/presentation/widget/home_screen_list.dart';
import 'package:fitness_app/features/home/presentation/widget/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../core/common/get_responsive_height_and_width.dart';
import '../../../core/router/pages_routes.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/text_styles.dart';
import '../../../generated/l10n.dart';
import '../../profile/presentation/cubit/profile_state.dart';
import '../../profile/presentation/cubit/profile_view_model.dart';
import 'cubit/get_meals_categories_cubit/get_meals_categories_cubit.dart';
import 'cubit/recommendation_cubit/recommendation_cubit.dart';
import 'cubit/workout_cubit/workout_cubit.dart';

class HomeTap extends StatefulWidget {
   const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {


  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return  Container(

      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.exerciseBackground),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.widthResponsive,
            // vertical: 8.HeightResponsive,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                BlocBuilder<ProfileViewModel, ProfileState>(
                  builder: (context, state) {
                    if (state is SuccessProfileState) {
                      final user = state.user;
                      return HomeAppBAr(
                        firstName: user?.firstName ?? '',
                        imageUrl: user?.photo ?? '',
                      );
                    } else if (state is LoadingProfileState) {
                      return HomeAppBAr(
                        firstName: '...',
                        imageUrl: '',
                      );
                    } else {
                      return HomeAppBAr(
                        firstName: '',
                        imageUrl: '',
                      );
                    }
                  },
                ),


                HomeSizedBox(),
                RowWidget(txt: tr.category, leadingText: '',onPressed: () {  },haveLeadingText: false,),
                SizedBox(height: responsiveHeight(8),),
                HomeCategoryList(),
                HomeSizedBox(),

                RowWidget(txt: tr.recommendationToDay, leadingText: '',onPressed: () {  },haveLeadingText: false,),
                BlocBuilder<RecommendationCubit, RecommendationState>(
                  builder: (context, state) {
                    if (state is RecommendationLoading) {
                      log("Recommendation RecommendationLoading ");
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    } else if (state is RecommendationSuccess) {
                      return state.data.exercises == null
                          ? Center(child: Text(tr.noExercisesAvailable,
                        style: AppTextStyles.balooThambi2_400_12.copyWith(color: AppColors.errorColor) ,))
                          :

                      HomeExerciseList(exercises: state.data.exercises ??[], isLarge: true,);

                    } else if (state is RecommendationError &&
                        !state.message.contains("internet")) {
                      log('${state.message}Recommendation');
                      return Center(child: Text(state.message,
                        style:  AppTextStyles.balooThambi2_400_12.
                        copyWith(color: AppColors.errorColor),));
                    } else if (state is RecommendationError &&
                        state.message.contains("internet")) {
                      EasyLoading.showError(state.message);
                    }

                    return const SizedBox.shrink();
                  },
                ),
                HomeSizedBox(),
                RowWidget(txt: tr.upcomingWorkouts, leadingText: tr.viewAll,
                  onPressed: () { Navigator.pushNamed(context, PagesRoutes.exerciseScreen,

                ); },),
                BlocBuilder<WorkoutCubit, WorkoutState>(
                  builder: (context, state) {
                    if (state is WorkoutLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    } else if (state is WorkoutSuccess) {
                      log("8888888888${state.data.exercises}");
                      log(state.data.exercises?[1].exercise??"nooooooooo");

                      return state.data.exercises == null
                          ? Center(child: Text(tr.noExercisesAvailable,
                        style: AppTextStyles.balooThambi2_400_12.copyWith(color: AppColors.errorColor) ,))
                          :

                      HomeExerciseList(exercises: state.data.exercises ??[], isLarge: false,);

                    } else if (state is WorkoutError &&
                        !state.message.contains("internet")) {
                      log(state.message);
                      return Center(child: Text(state.message,
                        style:  AppTextStyles.balooThambi2_400_12.
                        copyWith(color: AppColors.errorColor),));
                    } else if (state is WorkoutError &&
                        state.message.contains("internet")) {
                      EasyLoading.showError(state.message);
                    }

                    return const SizedBox.shrink();
                  },
                ),
                HomeSizedBox(),
                RowWidget(txt: tr.recommendationForYou, leadingText: tr.viewAll,onPressed:
                    () { Navigator.pushNamed(context, PagesRoutes.mealsCategories,

                ); },),
                BlocBuilder<GetHomeMealsCategoriesCubit, GetHomeMealsCategoriesStates>(
                  builder: (context, state) {
                    if (state is GetHomeMealsCategoriesLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    } else if (state is GetHomeMealsCategoriesSuccessState) {
                      log("8888888888${state.mealsCategoriesEntity}");
                      log(state.mealsCategoriesEntity[1].strCategory??"nooooooooo");

                      return HomeMealsList(meals: state.mealsCategoriesEntity , isLarge: true,);

                    } else if (state is GetHomeMealsCategoriesErrorState &&
                        state.message.contains("internet")) {
                      log(state.message);
                      return Center(child: Text(state.message,
                        style:  AppTextStyles.balooThambi2_400_12.
                        copyWith(color: AppColors.errorColor),));
                    } else if (state is GetHomeMealsCategoriesErrorState &&
                        state.message.contains("internet")) {
                      EasyLoading.showError(state.message);
                    }

                    return const SizedBox.shrink();
                  },
                ),

              ],
            ),
          ),
        ),


      ),
    );
  }

}


