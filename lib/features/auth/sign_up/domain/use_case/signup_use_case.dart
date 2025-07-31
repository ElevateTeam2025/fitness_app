
import 'package:fitness_app/features/auth/sign_up/domain/repo/signup_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../entity/signup_entity.dart';
import '../entity/signup_request_entity.dart';

@injectable
class SignupUseCase {
  final SignupRepo repository;

  SignupUseCase(this.repository);

  Future<Result<UserEntity>> call(SignupRequestEntity params)async {
    return await repository.signup(request: params);
  }
}
