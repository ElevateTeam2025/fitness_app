import 'package:fitness_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';

abstract class VerifyResetCodeRemoteDataSource {
  Future<void> verifyResetCode({required VerifyResetCodeRequest request});
}
