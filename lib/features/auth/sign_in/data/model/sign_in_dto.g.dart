// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInDTO _$SignInDTOFromJson(Map<String, dynamic> json) => SignInDTO(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoDTO.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignInDTOToJson(SignInDTO instance) => <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };

UserInfoDTO _$UserInfoDTOFromJson(Map<String, dynamic> json) => UserInfoDTO(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as num?,
      weight: json['weight'] as num?,
      height: json['height'] as num?,
      activityLevel: json['activityLevel'] as String?,
      goal: json['goal'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$UserInfoDTOToJson(UserInfoDTO instance) =>
    <String, dynamic>{
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
