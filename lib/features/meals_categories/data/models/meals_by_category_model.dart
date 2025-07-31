import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meals_by_category_model.g.dart';

@JsonSerializable()
class MealsByCategoryModel extends MealsByCategoryEntity {
  MealsByCategoryModel({
    required super.idMeal,
    required super.strMealThumb,
    required super.strMeal,
  });

  factory MealsByCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MealsByCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealsByCategoryModelToJson(this);
}
