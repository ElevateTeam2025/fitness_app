sealed class VerifyResetCodeStates {}

class VerifyResetCodeInitial extends VerifyResetCodeStates {}

class VerifyResetCodeLoading extends VerifyResetCodeStates {}

class VerifyResetCodeSuccess extends VerifyResetCodeStates {}

class VerifyResetCodeError extends VerifyResetCodeStates {
  final String error;
  VerifyResetCodeError(this.error);
}
