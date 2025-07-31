// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      message: json['message'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$SignupResponseModelToJson(
        SignupResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      activityLevel: json['activityLevel'] as String,
      goal: json['goal'] as String,
      photo: json['photo'] as String,
      id: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
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
      '_id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
    };
