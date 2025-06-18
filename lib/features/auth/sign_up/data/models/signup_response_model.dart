import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/signup_entity.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  final String message;
  final UserModel user;
  final String token;

  SignupResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}

@JsonSerializable()
class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final int age;
  final int weight;
  final int height;
  final String activityLevel;
  final String goal;
  final String photo;
  @JsonKey(name: '_id')
  final String id;
  final DateTime createdAt;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.activityLevel,
    required this.goal,
    required this.photo,
    required this.id,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
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
      id: id,
      createdAt: createdAt,
    );
  }
}
