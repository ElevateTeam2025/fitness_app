import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/custom_tab_bar_bloc_builder.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_bloc_listener.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_by_category_bloc_listener.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_by_category_grid_view.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_categories_back_ground_image.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_custom_app_bar.dart';
import 'package:flutter/material.dart';
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
    Future.microtask(() async {
      if (mounted) {
        await context.read<GetMealsCategoriesCubit>().doIntents(
          OnClickGetMealsCategories(),
        );
      }
    });
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetMealsCategoriesCubit>();
    final getMealsByCategoryViewModel = context.read<GetMealsByCategoryCubit>();
    return Stack(
      children: [
        const MealsCategoriesBackGroundImage(),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.WidthResponsive),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MealsCustomAppBar(),
                    MealsBlocListener(
                      viewModel: viewModel,
                      getMealsByCategoryViewModel: getMealsByCategoryViewModel,
                    ),
                    MealsByCategoryBlocListener(
                      getMealsByCategoryViewModel: getMealsByCategoryViewModel,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.HeightResponsive,
                      ),
                      child: CustomTabBarBlocBuilder(
                        viewModel: viewModel,
                        getMealsByCategoryViewModel:
                            getMealsByCategoryViewModel,
                      ),
                    ),
                   MealsByCategoryGridView()
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
