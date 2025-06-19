import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/features/meals_categories/domain/repo/get_meals_categories_repo.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_categories_views_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsCategoriesView extends StatelessWidget {
  const MealsCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMealsCategoriesCubit(
        getMealsCategoriesRepo: getIt.get<GetMealsCategoriesRepo>(),
      ),
      child: MealsCategoriesViewsBody(),
    );
  }
}
