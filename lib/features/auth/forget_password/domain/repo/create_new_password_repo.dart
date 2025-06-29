import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';

abstract class CreateNewPasswordRepo {
  Future<Result> createNewPassword({ required CreateNewPasswordrequset request });
}
