class MealDetailsResponse {
  final List<MealDetailsResponseEntity>? meals;

  MealDetailsResponse({this.meals});
}

class MealDetailsResponseEntity {
  final String? idMeal;
  final String? strMeal;
  final String? strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<Ingredient>? strIngredients;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  MealDetailsResponseEntity({
    this.idMeal,
    this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredients,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });
}

class Ingredient {
  final String? name;
  final String? measure;

  Ingredient({this.name, this.measure});
}
