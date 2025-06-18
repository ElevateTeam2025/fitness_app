import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';

abstract class VerifyResetCodeRepo {
  Future<Result> verifyResetCode({required VerifyResetCodeRequest request});
}
