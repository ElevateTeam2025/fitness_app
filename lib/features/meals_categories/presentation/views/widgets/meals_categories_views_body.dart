import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsCategoriesViewsBody extends StatefulWidget {
  const MealsCategoriesViewsBody({super.key});

  @override
  State<MealsCategoriesViewsBody> createState() =>
      _MealsCategoriesViewsBodyState();
}

class _MealsCategoriesViewsBodyState extends State<MealsCategoriesViewsBody> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<GetMealsCategoriesCubit>().doIntents(
        OnClickGetMealsCategories()
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
