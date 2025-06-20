import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MealsBlocListener extends StatelessWidget {
  const MealsBlocListener({
    super.key,
    required this.viewModel,
    required this.getMealsByCategoryViewModel,
  });

  final GetMealsCategoriesCubit viewModel;
  final GetMealsByCategoryCubit getMealsByCategoryViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetMealsCategoriesCubit, GetMealsCategoriesStates>(
      listener: (context, state) {
        if (state is GetMealsCategoriesErrorState) {
          EasyLoading.showError(state.message);
        } else if (state is GetMealsCategoriesSuccessState) {
          viewModel.categories = state.mealsCategoriesEntity;
          viewModel.selectedIndex = 0;
          viewModel.isLoaded = true;
          getMealsByCategoryViewModel.doIntents(
            OnClickGetMealsByCategoryIntent(),
            category: viewModel.categories[0].strCategory!,
          );
        }
      },
      child: SizedBox(),
    );
  }
}
