import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_dto.g.dart';

@JsonSerializable()
class SignInDTO {
  final String? message;
  @JsonKey(name: 'user')
  final UserInfoDTO? user;
  final String? token;

  SignInDTO({this.message, this.user, this.token});

  factory SignInDTO.fromJson(Map<String, dynamic> json) =>
      _$SignInDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SignInDTOToJson(this);

  SignInEntity toEntity() => SignInEntity(
    message: message,
    token: token,
    user: user?.toEntity(),
  );
}



@JsonSerializable()
class UserInfoDTO {
  @JsonKey(name: "_id")
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final num? age;
  final num? weight;
  final num? height;
  final String? activityLevel;
  final String? goal;
  final String? photo;

  UserInfoDTO({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
  });

  factory UserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDTOToJson(this);

  UserInfo toEntity() => UserInfo(
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    gender: gender,
    age: age,
    weight: weight,
    height: height,
    activityLevel: activityLevel,
    goal: goal,
    photo: photo,
  );
}





