import 'package:fitness_app/features/meals_categories/data/models/meal_categories_model.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_categories_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meal_categories_reponse.g.dart';

@JsonSerializable()
class MealCategoriesReponse {
  @JsonKey(name: 'categories')
  List<MealCategoriesModel> mealCategoriesModel;
  MealCategoriesReponse({required this.mealCategoriesModel});

  factory MealCategoriesReponse.fromJson(Map<String, dynamic> json) =>
      _$MealCategoriesReponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealCategoriesReponseToJson(this);

  List<MealsCategoriesEntity> toEntity() => mealCategoriesModel
      .map(
        (e) => MealsCategoriesEntity(
          strCategory: e.strCategory,
          strCategoryThumb: e.strCategoryThumb,
          strCategoryDescription: e.strCategoryDescription,
          idCategory: e.idCategory,
        ),
      )
      .toList();
}
