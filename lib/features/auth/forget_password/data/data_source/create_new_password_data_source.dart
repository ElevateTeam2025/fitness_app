import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';

abstract class CreateNewPasswordDataSource {
  Future<void> createNewPassword({required CreateNewPasswordrequset request});
}
