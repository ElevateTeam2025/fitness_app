sealed class ForgetPasswordStates {}

class ForgetPasswordInitial extends ForgetPasswordStates {}

class ForgetPasswordLoading extends ForgetPasswordStates {}

class ForgetPasswordSuccess extends ForgetPasswordStates {}

class ForgetPasswordError extends ForgetPasswordStates {
  final String message;
  ForgetPasswordError({required this.message});
}
