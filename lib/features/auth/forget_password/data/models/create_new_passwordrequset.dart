import 'package:json_annotation/json_annotation.dart';
part 'create_new_passwordrequset.g.dart';

@JsonSerializable()
class CreateNewPasswordrequset {
   String email;
   String newPassword;

  CreateNewPasswordrequset({required this.email, required this.newPassword});

  factory CreateNewPasswordrequset.fromJson(Map<String, dynamic> json) =>
      _$CreateNewPasswordrequsetFromJson(json);

  Map<String, dynamic> toJson() => _$CreateNewPasswordrequsetToJson(this);
}
