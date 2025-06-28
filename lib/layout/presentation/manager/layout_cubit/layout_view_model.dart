import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injectable_initializer.dart';
import '../../../../features/chatbot/presentation/view/chatbot_tab.dart';
import '../../../../features/home/presentation/cubit/get_meals_categories_cubit/get_meals_categories_cubit.dart';
import '../../../../features/home/presentation/cubit/recommendation_cubit/recommendation_cubit.dart';
import '../../../../features/home/presentation/cubit/workout_cubit/workout_cubit.dart';
import '../../../../features/home/presentation/home_tap.dart';
import '../../../../features/worksout/presentation/view/workout_screen.dart';
import '../../tabs/profile_tab.dart';
import 'layout_state.dart';

class LayoutViewModel extends Cubit<LayoutState> {
  LayoutViewModel() : super(LayoutInitialState());
  int currentIndex = 0;

  void doIntent(LayoutIntent layoutIntent) {
    switch (layoutIntent) {
      case LayoutChangeBottomNavIntent():
        _changeBottomNav(layoutIntent.index);
    }
  }


List<Widget>tabs=[
  MultiBlocProvider(
    providers: [
    BlocProvider(
      create: (context) => getIt.get<WorkoutCubit>()..fetchWorkout(),
    ),
    BlocProvider(
      create: (context) => getIt.get<RecommendationCubit>()..fetchWorkout(),
    ),
      BlocProvider(
        create: (context) => getIt.get<GetHomeMealsCategoriesCubit>()..getHomeMealsCategories(),
      ),
  ], child: HomeTap(),),

  ChatbotTab(), WorkoutTab(), ProfileTab()
];

  void _changeBottomNav(int index) {
    emit(LayoutInitialState());
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}

sealed class LayoutIntent {}

class LayoutChangeBottomNavIntent extends LayoutIntent {
  int index;

  LayoutChangeBottomNavIntent(this.index);
}
