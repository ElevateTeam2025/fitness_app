import 'package:fitness_app/features/meal_details/domain/entites/meal_details_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_details_reposonse_dto.g.dart';

@JsonSerializable()
class MealDetailsResponseDTO {
  final List<MealDetailsDTO>? meals;

  MealDetailsResponseDTO({this.meals});

  factory MealDetailsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$MealDetailsResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MealDetailsResponseDTOToJson(this);

  MealDetailsResponse toEntity() {
    return MealDetailsResponse(
      meals: meals?.map((meal) => meal.toEntity()).toList() ?? [],
    );
  }
}

@JsonSerializable()
class MealDetailsDTO {
  final String? idMeal;
  final String? strMeal;
  final String? strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strIngredient7;
  final String? strIngredient8;
  final String? strIngredient9;
  final String? strIngredient10;
  final String? strIngredient11;
  final String? strIngredient12;
  final String? strIngredient13;
  final String? strIngredient14;
  final String? strIngredient15;
  final String? strIngredient16;
  final String? strIngredient17;
  final String? strIngredient18;
  final String? strIngredient19;
  final String? strIngredient20;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;
  final String? strMeasure7;
  final String? strMeasure8;
  final String? strMeasure9;
  final String? strMeasure10;
  final String? strMeasure11;
  final String? strMeasure12;
  final String? strMeasure13;
  final String? strMeasure14;
  final String? strMeasure15;
  final String? strMeasure16;
  final String? strMeasure17;
  final String? strMeasure18;
  final String? strMeasure19;
  final String? strMeasure20;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  MealDetailsDTO({
    this.idMeal,
    this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory MealDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$MealDetailsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MealDetailsDTOToJson(this);

  List<Ingredient> convertIngrediants(Map<String, dynamic> json) {
    final ingredients = List.filled(20, '');
    final measures = List.filled(20, '');
    for (int i = 0; i < ingredients.length; i++) {
      ingredients[i] = json['strIngredient${i + 1}'];
      measures[i] = json['strMeasure${i + 1}'];
    }
    return List.generate(20, (index) {
      return Ingredient(name: ingredients[index], measure: measures[index]);
    });
  }

  MealDetailsResponseEntity toEntity() {
    return MealDetailsResponseEntity(
      idMeal: idMeal,
      strMeal: strMeal,
      strMealAlternate: strMealAlternate,
      strCategory: strCategory,
      strArea: strArea,
      strInstructions: strInstructions,
      strMealThumb: strMealThumb,
      strTags: strTags,
      strYoutube: strYoutube,
      strIngredients: convertIngrediants(toJson()),
      strSource: strSource,
      strImageSource: strImageSource,
      dateModified: dateModified,
    );
  }
}
