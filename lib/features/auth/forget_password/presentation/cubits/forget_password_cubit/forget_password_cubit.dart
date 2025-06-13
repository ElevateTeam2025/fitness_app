import 'dart:developer';

import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordRepo _forgetPasswordRepo;

  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  set autovalidateMode(AutovalidateMode value) {
    _autovalidateMode = value;
  }

  final ForgotPasswordRequest request = ForgotPasswordRequest(email: '');

  ForgetPasswordCubit(this._forgetPasswordRepo)
    : super(ForgetPasswordInitial());

  void doIntent(ForgetPasswordIntent intent) async {
    log('calllling');
    switch (intent) {
      case SendForgotPasswordIntent():
        await _forgetPassword(request: request);
        break;
    }
  }

  Future<void> _forgetPassword({required ForgotPasswordRequest request}) async {
    emit(ForgetPasswordLoading());
    final Result result = await _forgetPasswordRepo.forgetPassword(
      request: request,
    );

    switch (result) {
      case Success():
        emit(ForgetPasswordSuccess());
        break;

      case Error():
        log("${result.exception}error in the forget password cubit");
        emit(ForgetPasswordError(message: result.exception.toString()));
        break;
    }
  }
}

sealed class ForgetPasswordIntent {}

class SendForgotPasswordIntent extends ForgetPasswordIntent {}
