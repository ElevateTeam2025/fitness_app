sealed class CreateNewPasswordStates {}

class CreateNewPasswordInitial extends CreateNewPasswordStates {}

class CreateNewPasswordLoading extends CreateNewPasswordStates {}

class CreateNewPasswordSuccess extends CreateNewPasswordStates {}

class CreateNewPasswordError extends CreateNewPasswordStates {
  final String message;
  CreateNewPasswordError({required this.message});
}
