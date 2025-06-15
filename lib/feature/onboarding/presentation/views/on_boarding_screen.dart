import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/feature/onboarding/presentation/cubits/change_onboarding_state.dart';
import 'package:fitness_app/feature/onboarding/presentation/cubits/change_onboarding_view_model.dart';
import 'package:fitness_app/feature/onboarding/presentation/views/widgets/onboarding_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();
  late ChangeOnboardingViewModel changeOnboardingViewModel;

  @override
  void initState() {
    changeOnboardingViewModel = getIt.get<ChangeOnboardingViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => changeOnboardingViewModel,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<ChangeOnboardingViewModel, ChangeOnboardingState>(
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    ImageAssets.onboardingBg,
                    fit: BoxFit.cover,
                  ),
                ),
                PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (int index) {
                    changeOnboardingViewModel.index = index;
                    changeOnboardingViewModel.doIntent(
                      ClickedChangeOnboardingIntent(),
                    );
                  },
                  itemCount: changeOnboardingViewModel.boarding.length,
                  itemBuilder: (context, index) {
                    return OnBoardingItemWidget(
                      index: changeOnboardingViewModel.index,
                      onboardingEntity:
                          changeOnboardingViewModel.boarding[index],
                      pageController: pageController,
                      boardingItems: changeOnboardingViewModel.boarding,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
