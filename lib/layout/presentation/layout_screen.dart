import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/chatbot/presentation/view/chatbot_tab.dart';
import 'package:fitness_app/features/worksout/presentation/view/workout_screen.dart';
import 'package:fitness_app/layout/presentation/widgets/tab_bar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_assets.dart';
import '../../generated/l10n.dart';
import 'manager/layout_cubit/layout_state.dart';
import 'manager/layout_cubit/layout_view_model.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return BlocProvider(
      create: (context) => LayoutViewModel(initialIndex),
      child: BlocBuilder<LayoutViewModel, LayoutState>(
        builder: (context, state) {
          final viewModel = context.read<LayoutViewModel>();
          return Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: true,
            backgroundColor: AppColors.greyDark2,
            body: viewModel.tabs[viewModel.currentIndex],


            bottomNavigationBar: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              TabBarItemWidget(currentIndex: viewModel.currentIndex, index: 0,
                icon:IconAssets.homeIcon, label: tr.home,
              onTap:() =>viewModel.doIntent(LayoutChangeBottomNavIntent(0),),),
                  TabBarItemWidget(currentIndex: viewModel.currentIndex, index: 1,
                    icon:IconAssets.chatIcon, label: tr.chat,
                    onTap:() =>viewModel.doIntent(LayoutChangeBottomNavIntent(1),),),
                  TabBarItemWidget(currentIndex: viewModel.currentIndex,
                    index: 2, icon:IconAssets.workoutIcon, label: tr.workout,
                    onTap:() =>viewModel.doIntent(LayoutChangeBottomNavIntent(2),),),
                  TabBarItemWidget(currentIndex: viewModel.currentIndex,
                    index: 3, icon:IconAssets.profileIcon, label:  tr.profile,
                    onTap:() =>viewModel.doIntent(LayoutChangeBottomNavIntent(3),),),

                ],
              ),
            ),


          );
        },
      ),
    );
  }
}
