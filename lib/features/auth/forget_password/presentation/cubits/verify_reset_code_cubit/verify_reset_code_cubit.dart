import 'dart:developer';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repo/verify_reset_code_repo.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/verify_reset_code_cubit/verify_reset_code_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeCubit extends Cubit<VerifyResetCodeStates> {
  final VerifyResetCodeRepo _verifyResetCodeRepo;

  final TextEditingController verifyResetCodeController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  set autovalidateMode(AutovalidateMode value) {
    _autovalidateMode = value;
  }

  VerifyResetCodeRequest request = VerifyResetCodeRequest(resetCode: '');

  VerifyResetCodeCubit({required VerifyResetCodeRepo verifyResetCodeRepo})
    : _verifyResetCodeRepo = verifyResetCodeRepo,
      super(VerifyResetCodeInitial());

  void doIntent(VerifyResetCodeIntent intent) async {
    switch (intent) {
      case SendVerifyResetCodeIntent():
        await _verifyResetCode(request: request);
        break;
    }
  }

  Future<void> _verifyResetCode({
    required VerifyResetCodeRequest request,
  }) async {
    emit(VerifyResetCodeLoading());
    final Result result = await _verifyResetCodeRepo.verifyResetCode(
      request: request,
    );
    switch (result) {
      case Success():
        log('success in the verify reset code cubit');
        emit(VerifyResetCodeSuccess());
        break;

      case Error():
        log('error in the verify reset code cubit');
        emit(VerifyResetCodeError(result.exception.toString()));
        break;
    }
  }
}

sealed class VerifyResetCodeIntent {}

class SendVerifyResetCodeIntent extends VerifyResetCodeIntent {}
