
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_entity.dart';

import '../entity/sign_in_request.dart';


abstract class AuthRepository {
  Future<Result<SignInEntity>> signIn(SignInRequest data);
  Future<void> saveToken(String token);
}
