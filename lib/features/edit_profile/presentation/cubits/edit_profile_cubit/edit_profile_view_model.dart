import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/edit_profile/domain/use_case/edit_profile_use_case.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/edit_profile_cubit/edit_profile_states.dart';

class EditProfileViewModel extends Cubit<EditProfileStates> {
  final EditProfileUseCase _editProfileUseCase;
  EditProfileViewModel(this._editProfileUseCase) : super(EditProfileInitial());

  doIntents(
    EditProfileIntent intent, {
    required Map<String, dynamic> data,
  }) async {
    switch (intent) {
      case OnClickEditProfileIntent():
        await _editProfile(data);
        break;
    }
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

class OnClickEditProfileIntent extends EditProfileIntent {}
