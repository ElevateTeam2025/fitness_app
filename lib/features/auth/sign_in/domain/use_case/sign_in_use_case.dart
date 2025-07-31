import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_entity.dart';
import 'package:injectable/injectable.dart';

import '../entity/sign_in_request.dart';
import '../repository/auth_repository.dart';

@injectable
class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<Result<SignInEntity>> execute(SignInRequest data) {
    return _authRepository.signIn(data);
  }
}
