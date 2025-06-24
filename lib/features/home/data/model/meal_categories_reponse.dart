

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/meals_categories_entity.dart';
import 'meal_categories_model.dart';
part 'meal_categories_reponse.g.dart';

@JsonSerializable()
class HomeMealCategoriesReponse {
  @JsonKey(name: 'categories')
  List<HomeMealCategoriesModel> mealCategoriesModel;
  HomeMealCategoriesReponse({required this.mealCategoriesModel});

  factory HomeMealCategoriesReponse.fromJson(Map<String, dynamic> json) =>
      _$HomeMealCategoriesReponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeMealCategoriesReponseToJson(this);

  List<HomeMealsCategoriesEntity> toEntity() => mealCategoriesModel
      .map(
        (e) => HomeMealsCategoriesEntity(
          strCategory: e.strCategory,
          strCategoryThumb: e.strCategoryThumb,
          strCategoryDescription: e.strCategoryDescription,
          idCategory: e.idCategory,
        ),
      )
      .toList();
}
