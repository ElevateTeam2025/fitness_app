import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MealsByCategoryBlocListener extends StatefulWidget {
  const MealsByCategoryBlocListener({
    super.key,
    required this.getMealsByCategoryViewModel,
  });

  final GetMealsByCategoryCubit getMealsByCategoryViewModel;

  @override
  State<MealsByCategoryBlocListener> createState() =>
      _MealsByCategoryBlocListenerState();
}

class _MealsByCategoryBlocListenerState
    extends State<MealsByCategoryBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetMealsByCategoryCubit, GetMealsByCategoryStates>(
      listener: (context, state) {
        if (state is GetMealsByCategoryErrorState) {
          EasyLoading.showError(state.message);
        } else if (state is GetMealsByCategorySuccessState) {
          widget.getMealsByCategoryViewModel.mealsByCategoryEntity =
              state.mealsByCategoryEntity;
          setState(() {});
        }
      },
      child: SizedBox(),
    );
  }
}
