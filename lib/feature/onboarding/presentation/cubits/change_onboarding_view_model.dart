import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/feature/onboarding/domain/onboarding_entity.dart';
import 'package:fitness_app/feature/onboarding/presentation/cubits/change_onboarding_state.dart';

class ChangeOnboardingViewModel extends Cubit<ChangeOnboardingState> {
  ChangeOnboardingViewModel() : super(ChangePageOnBoardingInitialState());

  bool _isLast = false;
  final List<OnboardingEntity> _boarding = [
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
  final int _index = 0;
  void doIntent(ChangeOnboardingIntent intent) {
    switch (intent) {
      case ClickedChangeOnboardingIntent():
        _changePage(_index);
        break;
      case GetIsLastPageIntent():
        _isLastPage;
        break;
      case GetBoradingItemsIntent():
        _boardingItems;
        break;
    }
  }

  bool get _isLastPage => _isLast;
  List<OnboardingEntity> get _boardingItems => _boarding;

  void _changePage(int index) {
    if (index == _boarding.length - 1) {
      _isLast = true;
    } else {
      _isLast = false;
    }
    emit(ChangePageOnBoardingState());
  }
}

sealed class ChangeOnboardingIntent {}

class ClickedChangeOnboardingIntent extends ChangeOnboardingIntent {}

class GetIsLastPageIntent extends ChangeOnboardingIntent {}

class GetBoradingItemsIntent extends ChangeOnboardingIntent {}
