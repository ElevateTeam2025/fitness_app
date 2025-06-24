import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/worksout/presentation/view/workout_screen.dart';
import '../../tabs/home_tap.dart';
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

  List<Widget> tabs = [HomeTap(), ProfileTab(), WorkoutTab(), ProfileTab()];

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
