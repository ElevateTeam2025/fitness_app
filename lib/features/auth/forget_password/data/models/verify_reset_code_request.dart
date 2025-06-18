import 'package:json_annotation/json_annotation.dart';
part 'verify_reset_code_request.g.dart';

@JsonSerializable()
class VerifyResetCodeRequest {
  String resetCode;

  VerifyResetCodeRequest({required this.resetCode});

  factory VerifyResetCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestToJson(this);
}
