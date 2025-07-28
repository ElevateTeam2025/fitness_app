import 'package:json_annotation/json_annotation.dart';

import '../../domin/entity/change_password_entity.dart';


part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordModel extends ChangePasswordEntity {
  ChangePasswordModel({super.message, super.error, super.token});

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);
}
