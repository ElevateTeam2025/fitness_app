import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/meal_details/presentation/cubits/get_meal_details_cubit/get_meal_details_cubit.dart';
import 'package:fitness_app/features/meal_details/presentation/views/widgets/meal_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsView extends StatelessWidget {
  MealDetailsView({super.key});

  final GetMealDetailsCubit getMealDetailsCubit = getIt
      .get<GetMealDetailsCubit>();


  @override
  Widget build(BuildContext context) {
    final  args = ModalRoute.of(context)?.settings.arguments as List;
    return BlocProvider(
      create: (context) => getMealDetailsCubit,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: MealDetailsViewBody(args: args, viewmodel: getMealDetailsCubit),
      ),
    );
  }
}
