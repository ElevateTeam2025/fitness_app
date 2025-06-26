import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';

abstract class ResetNewPasswordDataSource {
  Future<void> resetNewPassword({required ResetNewPasswordrequset request});
}
