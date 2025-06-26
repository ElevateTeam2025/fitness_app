import 'package:json_annotation/json_annotation.dart';
part 'reset_password_request.g.dart';
@JsonSerializable()
class ResetPasswordRequest {
  String password ;
  String newPassword ;

  ResetPasswordRequest({required this.password , required this.newPassword}) ;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);

}