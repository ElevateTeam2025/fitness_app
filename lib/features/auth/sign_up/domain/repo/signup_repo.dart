


import 'package:fitness_app/features/auth/sign_up/domain/entity/signup_entity.dart';
import 'package:fitness_app/features/auth/sign_up/domain/entity/signup_request_entity.dart';

import '../../../../../core/common/result.dart';


abstract class SignupRepo{


  Future<Result<UserEntity>> signup({required SignupRequestEntity request });
}