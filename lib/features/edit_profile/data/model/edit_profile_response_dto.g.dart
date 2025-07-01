// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseDto _$EditProfileResponseDtoFromJson(
  Map<String, dynamic> json,
) => EditProfileResponseDto(
  message: json['message'] as String?,
  user: json['user'] == null
      ? null
      : UserDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EditProfileResponseDtoToJson(
  EditProfileResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'user': instance.user?.toJson(),
};

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  id: json['_id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  age: (json['age'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  activityLevel: json['activityLevel'] as String?,
  goal: json['goal'] as String?,
  photo: json['photo'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  '_id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'gender': instance.gender,
  'age': instance.age,
  'weight': instance.weight,
  'height': instance.height,
  'activityLevel': instance.activityLevel,
  'goal': instance.goal,
  'photo': instance.photo,
  'createdAt': instance.createdAt,
};
