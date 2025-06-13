import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';

abstract class ForgetPasswordRepo {
  Future<Result> forgetPassword({required ForgotPasswordRequest request});
}
