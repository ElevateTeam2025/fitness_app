import 'package:fitness_app/feature/auth/domain/entity/sign_in_entity.dart';

sealed class SignInState {}

class InitialSignInState extends SignInState {}

class LoadingSignInState extends SignInState {}

class SuccessSignInState extends SignInState {
  final SignInEntity data;
  SuccessSignInState(this.data);
}

class ErrorSignInState extends SignInState {
  final String message;
  ErrorSignInState(this.message);
}
