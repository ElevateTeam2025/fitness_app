import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/profile_entity.dart';

part 'profile_dto.g.dart';

@JsonSerializable()
class ProfileDTO {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'user')
  final UserDTO? user;

  ProfileDTO({
    this.message,
    this.user,
  });

  factory ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDTOToJson(this);

  ProfileEntity toEntity() {
    return ProfileEntity(
      message: message,
      user: user?.toEntity(),
    );
  }
}


@JsonSerializable()
class UserDTO {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'firstName')
  final String? firstName;

  @JsonKey(name: 'lastName')
  final String? lastName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'age')
  final num? age;

  @JsonKey(name: 'weight')
  final num? weight;

  @JsonKey(name: 'height')
  final num? height;

  @JsonKey(name: 'activityLevel')
  final String? activityLevel;

  @JsonKey(name: 'goal')
  final String? goal;

  @JsonKey(name: 'photo')
  final String? photo;

  UserDTO({
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

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  UserData toEntity() {
    return UserData(
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
}

