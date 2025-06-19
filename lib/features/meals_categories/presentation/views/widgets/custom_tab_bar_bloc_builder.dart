import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_states.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/custom_tab_bar_shimmer_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabBarBlocBuilder extends StatefulWidget {
  const CustomTabBarBlocBuilder({super.key, this.viewModel});
  final viewModel;
  @override
  State<CustomTabBarBlocBuilder> createState() =>
      _CustomTabBarBlocBuilderState();
}

class _CustomTabBarBlocBuilderState extends State<CustomTabBarBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMealsCategoriesCubit, GetMealsCategoriesStates>(
      builder: (context, state) {
        if (state is GetMealsCategoriesLoadingState) {
          return CustomTabBarShimmerAnimation();
        } else if (state is GetMealsCategoriesSuccessState &&
            widget.viewModel.categories.isNotEmpty) {
          return SizedBox(
            height: 53.HeightResponsive,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.viewModel.categories.length,
              itemBuilder: (context, index) {
                final isSelected = widget.viewModel.selectedIndex == index;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.WidthResponsive),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      widget.viewModel.selectedIndex = index;
                    }),
                    child: AnimatedContainer(
                      // height: 60.HeightResponsive,
                      // width: 80.WidthResponsive,
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 250),
                      padding: EdgeInsets.symmetric(
                        horizontal: 17.WidthResponsive,
                        vertical: 8.HeightResponsive,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          20.RadiusResponsive,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.viewModel.categories[index].strCategory ?? '',
                          style: AppTextStyles.BalooThambi2_700_12.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is GetMealsCategoriesErrorState) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
