import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<void> forgetPassword({required ForgotPasswordRequest request});
}
