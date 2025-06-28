sealed class EditProfileStates {}

class EditProfileInitial extends EditProfileStates {}

class EditProfileLoading extends EditProfileStates {}

class EditProfileSuccess extends EditProfileStates {}

class EditProfileError extends EditProfileStates {
  final String message;
  EditProfileError({required this.message});
}
