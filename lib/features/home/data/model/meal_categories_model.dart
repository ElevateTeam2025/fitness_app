import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/meals_categories_entity.dart';
part 'meal_categories_model.g.dart';

@JsonSerializable()
class HomeMealCategoriesModel extends HomeMealsCategoriesEntity {
  HomeMealCategoriesModel({
    required super.strCategory,
    required super.strCategoryThumb,
    required super.strCategoryDescription,
    required super.idCategory,
  });

  factory HomeMealCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$HomeMealCategoriesModelFromJson(json);

  HomeMealsCategoriesEntity toEntity() => HomeMealsCategoriesEntity(
    strCategory: strCategory,
    strCategoryThumb: strCategoryThumb,
    strCategoryDescription: strCategoryDescription,
    idCategory: idCategory,
  );
}
