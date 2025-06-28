import 'package:fitness_app/features/edit_profile/domain/entites/edit_profile_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class EditProfileResponseDto {
  final String? message;
  final UserDto? user;

  EditProfileResponseDto({this.message, this.user});

  factory EditProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseDtoToJson(this);
  EditProfileResponseEntity toEntity() {
    return EditProfileResponseEntity(message: message, user: user?.toEntity());
  }
}

@JsonSerializable()
class UserDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final int? age;
  final int? weight;
  final int? height;
  final String? activityLevel;
  final String? goal;
  final String? photo;
  final String? createdAt;

  UserDto({
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
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      createdAt: createdAt,
      age: age,
      weight: weight,
      height: height,
      activityLevel: activityLevel,
      goal: goal,
      photo: photo,
    );
  }
}
