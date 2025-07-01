// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) => ProfileDTO(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileDTOToJson(ProfileDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as num?,
      weight: (json['weight'] as num?)?.toInt(),
      height: json['height'] as num?,
      activityLevel: json['activityLevel'] as String?,
      goal: json['goal'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
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
    };
