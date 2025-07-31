import 'package:fitness_app/features/meals_categories/data/models/meals_by_category_model.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meals_by_category_response.g.dart';

@JsonSerializable()
class MealsByCategoryResponse {
  @JsonKey(name: 'meals')
  List<MealsByCategoryModel> mealsByCategoryModel;
  MealsByCategoryResponse({required this.mealsByCategoryModel});

  factory MealsByCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsByCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsByCategoryResponseToJson(this);

  List<MealsByCategoryEntity> toEntity() => mealsByCategoryModel
      .map(
        (e) => MealsByCategoryEntity(
          strMeal: e.strMeal,
          strMealThumb: e.strMealThumb,
          idMeal: e.idMeal,
        ),
      )
      .toList();
}
