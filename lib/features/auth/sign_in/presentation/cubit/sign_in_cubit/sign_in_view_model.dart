import 'package:fitness_app/core/common/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/sign_in_request.dart';
import '../../../domain/use_case/sign_in_use_case.dart';
import 'sign_in_state.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;
  SignInViewModel(this._signInUseCase) : super(InitialSignInState());

  void doIntent(SignInIntent intent) {
    if (intent is SignInClickedIntent) {
      _signIn(intent.data);
    }
  }

  void _signIn(SignInRequest data) async {
    emit(LoadingSignInState());
    var result = await _signInUseCase.execute(data);
    switch (result) {
      case Success():
        emit(SuccessSignInState(result.data!));
      case Error():
        emit(ErrorSignInState(result.exception!));
    }
  }
}

sealed class SignInIntent {}

class SignInClickedIntent extends SignInIntent {
  final SignInRequest data;
  SignInClickedIntent(this.data);
}
