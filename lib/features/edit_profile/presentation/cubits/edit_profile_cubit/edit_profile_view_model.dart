import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/edit_profile/domain/use_case/edit_profile_use_case.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/edit_profile_cubit/edit_profile_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileStates> {
  final EditProfileUseCase _editProfileUseCase;
  EditProfileViewModel(this._editProfileUseCase) : super(EditProfileInitial());

  doIntents(EditProfileIntent intent) async {
    switch (intent) {
      case OnClickEditProfileIntent():
        await _editProfile(intent.data);
        break;
      case OnChangeWeightIntent():
        _changeWeight(intent.newWeight);
        break;
      case OnChangeGoalIntent():
        _changeGoal(intent.newGoal);
        break;
      case OnChangeActivityIntent():
        _changeActivity(intent.newActivity);
        break;
      default:
        break;
    }
  }

  int weight = 0;
  String selectedGoal = '';
  String selectedActivity = '';

  _changeWeight(int newWeight) {
    weight = newWeight;
    emit(EditProfileWeightChanged());
  }

  _changeGoal(String newGoal) {
    selectedGoal = newGoal;
    emit(EditProfileGoalChanged());
  }

  _changeActivity(String newActivity) {
    selectedActivity = newActivity;
    emit(EditProfileActivityChanged());
  }

  Future<void> _editProfile(Map<String, dynamic> data) async {
    emit(EditProfileLoading());
    final result = await _editProfileUseCase.execute(data);
    switch (result) {
      case Success():
        emit(EditProfileSuccess());
        break;
      case Error():
        emit(EditProfileError(message: result.exception.toString()));
        break;
    }
  }
}

sealed class EditProfileIntent {}

class OnClickEditProfileIntent extends EditProfileIntent {
  final Map<String, dynamic> data;

  OnClickEditProfileIntent(this.data);
}

class OnChangeWeightIntent extends EditProfileIntent {
  final int newWeight;

  OnChangeWeightIntent(this.newWeight);
}

class OnChangeGoalIntent extends EditProfileIntent {
  final String newGoal;

  OnChangeGoalIntent(this.newGoal);
}

class OnChangeActivityIntent extends EditProfileIntent {
  final String newActivity;

  OnChangeActivityIntent(this.newActivity);
}
