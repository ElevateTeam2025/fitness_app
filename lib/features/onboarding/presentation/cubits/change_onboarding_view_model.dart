import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/features/onboarding/domain/onboarding_entity.dart';
import 'package:fitness_app/features/onboarding/presentation/cubits/change_onboarding_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangeOnboardingViewModel extends Cubit<ChangeOnboardingState> {
  ChangeOnboardingViewModel() : super(ChangePageOnBoardingInitialState());

  bool isLast = false;
  final List<OnboardingEntity> boarding = [
    OnboardingEntity(
      image: ImageAssets.onBoradingImage_1,
      title: 'the price of excellence is discipline',
      body:
          'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ',
    ),
    OnboardingEntity(
      image: ImageAssets.onBoradingImage_2,
      title: 'Fitness has never been so much fun',
      body:
          'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ',
    ),
    OnboardingEntity(
      image: ImageAssets.onBoradingImage_3,
      title: 'NO MORE EXCUSES Do It Now',
      body:
          'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ',
    ),
  ];
  int index = 0;
  void doIntent(ChangeOnboardingIntent intent) {
    switch (intent) {
      case ClickedChangeOnboardingIntent():
        _changePage(index);
        break;
    }
  }

  void _changePage(int index) {
    if (index == boarding.length - 1) {
      isLast = true;
    } else {
      isLast = false;
    }
    emit(ChangePageOnBoardingState());
  }
}

sealed class ChangeOnboardingIntent {}

class ClickedChangeOnboardingIntent extends ChangeOnboardingIntent {}
