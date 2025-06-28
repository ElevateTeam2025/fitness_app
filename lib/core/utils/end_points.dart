const String baseUrl = 'https://fitness.elevateegy.com/api/v1';
const String mealsBaseUrl = 'https://www.themealdb.com/api/json/v1';

class ApiEndPoints {
  ApiEndPoints._();
  static const String signIn = "/auth/signin";
  static const String forgotPassword = "/auth/forgotPassword";
  static const String verifyResetCode = "/auth/verifyResetCode";
  static const String signUp = "/auth/signup";
  static const String resetPassword = "/auth/resetPassword";
  static const String mealsCategories = "/1/categories.php";
  static const String mealsByCategory = "/1/filter.php";
  static const String mealDetails = "/1/lookup.php";
  static const String getExercise = "/exercises/by-muscle-difficulty";
  static const String getLevelsEndPoint = "/levels";
  static const String workoutTabs = "/muscles";
  static const String muscles = "/musclesGroup";
  static const String getAllExercise = "/exercises";
  static const String getRecommendExercise = "/exercises/random";
  static const String uploadProfilePhoto = "/auth/upload-photo";
  static const String editProfile = "/auth/editProfile";
}
