// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_categories_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMealCategoriesReponse _$HomeMealCategoriesReponseFromJson(
  Map<String, dynamic> json,
) => HomeMealCategoriesReponse(
  mealCategoriesModel: (json['categories'] as List<dynamic>)
      .map((e) => HomeMealCategoriesModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeMealCategoriesReponseToJson(
  HomeMealCategoriesReponse instance,
) => <String, dynamic>{'categories': instance.mealCategoriesModel};
