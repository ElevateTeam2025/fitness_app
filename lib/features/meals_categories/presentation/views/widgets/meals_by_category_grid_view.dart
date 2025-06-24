import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_states.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meal_grid_view_item.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meal_grid_view_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsByCategoryGridView extends StatelessWidget {
  const MealsByCategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMealsByCategoryCubit, GetMealsByCategoryStates>(
      builder: (context, state) {
        if (state is GetMealsByCategoryLoadingState) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 17.WidthResponsive,
              mainAxisSpacing: 17.HeightResponsive,
            ),
            itemBuilder: (context, index) {
              return MealGridViewShimmerLoading();
            },
          );
        } else if (state is GetMealsByCategorySuccessState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.mealsByCategoryEntity.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 17.WidthResponsive,
              mainAxisSpacing: 17.HeightResponsive,
            ),
            itemBuilder: (context, index) {
              final meal = state.mealsByCategoryEntity[index];
              return MealGridViewItem(
                meal: meal,
                meals: state.mealsByCategoryEntity,
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
