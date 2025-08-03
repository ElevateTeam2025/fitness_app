
import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/meal_details/presentation/cubits/get_meal_details_cubit/get_meal_details_cubit.dart';
import 'package:fitness_app/features/meal_details/presentation/cubits/get_meal_details_cubit/get_meal_details_states.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/custom_arrow_back_widget.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/custom_title_meal_for_expanded.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/flexiable_widget.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/ingredients_section.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/recommendation_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MealDetailsViewBody extends StatefulWidget {
 const MealDetailsViewBody({super.key, required this.args, required this.viewmodel});
  final List args;
  final GetMealDetailsCubit viewmodel;

  @override
  State<MealDetailsViewBody> createState() => _MealDetailsViewBodyState();
}

class _MealDetailsViewBodyState extends State<MealDetailsViewBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.viewmodel.doIntents(
        OnClickGetMealDetailsIntent(),
        mealId: widget.args[0],
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(ImageAssets.mealDetailsBg, fit: BoxFit.cover),
        ),
        BlocConsumer<GetMealDetailsCubit, GetMealDetailsStates>(
          listener: (context, state) {
            switch (state) {
              case GetMealDetailsLoadingState():
                EasyLoading.show();
              case GetMealDetailsSuccessState():
                EasyLoading.dismiss();
              case GetMealDetailsErrorState():
                EasyLoading.dismiss();
                EasyLoading.showError(state.message);
              default:
                break;
            }
          },
          builder: (context, state) {
            if (state is GetMealDetailsSuccessState) {
              final data = state.mealDetailsResponseEntity;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 70.heightResponsive,
                    title: CustomArrowBackWidget(),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(0.heightResponsive),
                      child: CustomTitleMealForExpanded(
                        strMeal: data.strMeal ?? '',
                      ),
                    ),
                    pinned: true,
                    backgroundColor: AppColors.primaryColor,
                    expandedHeight: 350.heightResponsive,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CustomFlexibleWidget(data: data),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IngredientsSection(data: data),
                        SizedBox(height: 20.heightResponsive),
                        RecommendationSection(args: widget.args),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}


