// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_categories_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealCategoriesReponse _$MealCategoriesReponseFromJson(
  Map<String, dynamic> json,
) => MealCategoriesReponse(
  mealCategoriesModel: (json['categories'] as List<dynamic>)
      .map((e) => MealCategoriesModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MealCategoriesReponseToJson(
  MealCategoriesReponse instance,
) => <String, dynamic>{'categories': instance.mealCategoriesModel};
