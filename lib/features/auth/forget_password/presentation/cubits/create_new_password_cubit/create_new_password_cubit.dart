import 'dart:developer';

import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repo/create_new_password_repo.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/create_new_password_cubit/create_new_password_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateNewPasswordCubit extends Cubit<CreateNewPasswordStates> {
  final CreateNewPasswordRepo _createNewPasswordRepo;
  CreateNewPasswordCubit({required CreateNewPasswordRepo createNewPasswordRepo})
    : _createNewPasswordRepo = createNewPasswordRepo,
      super(CreateNewPasswordInitial());

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  set isPasswordVisible(bool value) {
    _isPasswordVisible = value;
  }

  CreateNewPasswordrequset request = CreateNewPasswordrequset(
    email: '',
    newPassword: '',
  );

  void doIntent(CreateNewPasswordIntent intent) {
    switch (intent) {
      case ExecuteCreateNewPasswordIntent():
        _createNewPassword(request: request);
        break;
    }
  }

  Future<void> _createNewPassword({
    required CreateNewPasswordrequset request,
  }) async {
    emit(CreateNewPasswordLoading());

    final Result result = await _createNewPasswordRepo.createNewPassword(
      request: request,
    );

    switch (result) {
      case Success():
        log('success in the create new password cubit');
        emit(CreateNewPasswordSuccess());
        break;
      case Error():
        log('error in the create new password cubit');
        emit(CreateNewPasswordError(message: result.exception.toString()));
        break;
    }
  }
}

sealed class CreateNewPasswordIntent {}

class ExecuteCreateNewPasswordIntent extends CreateNewPasswordIntent {}
