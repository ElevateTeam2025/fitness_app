import 'package:fitness_app/features/meals_categories/domain/entities/meals_categories_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meal_categories_model.g.dart';

@JsonSerializable()
class MealCategoriesModel extends MealsCategoriesEntity {
  MealCategoriesModel({
    required super.strCategory,
    required super.strCategoryThumb,
    required super.strCategoryDescription,
    required super.idCategory,
  });

  factory MealCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$MealCategoriesModelFromJson(json['categories']);

  MealsCategoriesEntity toEntity() => MealsCategoriesEntity(
    strCategory: strCategory,
    strCategoryThumb: strCategoryThumb,
    strCategoryDescription: strCategoryDescription,
    idCategory: idCategory,
  );
}
