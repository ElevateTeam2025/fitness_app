// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealCategoriesModel _$MealCategoriesModelFromJson(Map<String, dynamic> json) =>
    MealCategoriesModel(
      strCategory: json['strCategory'] as String?,
      strCategoryThumb: json['strCategoryThumb'] as String?,
      strCategoryDescription: json['strCategoryDescription'] as String?,
      idCategory: json['idCategory'] as String?,
    );

Map<String, dynamic> _$MealCategoriesModelToJson(
  MealCategoriesModel instance,
) => <String, dynamic>{
  'strCategory': instance.strCategory,
  'strCategoryThumb': instance.strCategoryThumb,
  'strCategoryDescription': instance.strCategoryDescription,
  'idCategory': instance.idCategory,
};
