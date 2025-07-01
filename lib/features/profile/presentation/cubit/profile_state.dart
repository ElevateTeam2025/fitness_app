import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';

sealed class ProfileState {}

class LoadingProfileState extends ProfileState {}

class SuccessProfileState extends ProfileState {
  final UserData? user;
  SuccessProfileState(this.user);
}

class ErrorProfileState extends ProfileState {
  final String message;
  ErrorProfileState(this.message);
}

class LogoutSuccessState extends ProfileState {}
