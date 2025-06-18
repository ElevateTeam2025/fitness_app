import 'package:fitness_app/feature/auth/domain/entity/sign_in_entity.dart';

import '../../../../core/common/result.dart';
import '../entity/sign_in_request.dart';


abstract class AuthRepository {
  Future<Result<SignInEntity>> signIn(SignInRequest data);
  Future<void> saveToken(String token);
}
