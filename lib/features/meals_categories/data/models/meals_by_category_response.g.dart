// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_by_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsByCategoryResponse _$MealsByCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    MealsByCategoryResponse(
      mealsByCategoryModel: (json['meals'] as List<dynamic>)
          .map((e) => MealsByCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealsByCategoryResponseToJson(
        MealsByCategoryResponse instance) =>
    <String, dynamic>{
      'meals': instance.mealsByCategoryModel,
    };
