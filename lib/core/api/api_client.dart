import 'package:dio/dio.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:fitness_app/features/auth/sign_in/data/model/sign_in_dto.dart';
import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_request.dart';
import 'package:fitness_app/features/edit_profile/data/model/edit_profile_response_dto.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_model.dart';
import 'package:fitness_app/features/worksout/data/model/muscles_data_response_model.dart';
import 'package:fitness_app/features/worksout/data/model/muscles_tab_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';



import '../../features/Exercise/data/model/exercise_dto.dart';
import '../../features/Exercise/data/model/levels_response_dto.dart';



import '../../features/auth/change_password/date/model/change_password_model.dart';
import '../../features/auth/change_password/date/model/change_password_request_model.dart';
import '../../features/auth/sign_up/data/models/signup_request_model.dart';
import '../../features/auth/sign_up/data/models/signup_response_model.dart';


import '../../features/home/data/model/exercise_response_dto.dart';
import '../../features/profile/data/model/profile_dto.dart';
import '../utils/end_points.dart';
part 'api_client.g.dart';

// @RestApi(baseUrl: 'https://fitness.elevateegy.com/api/v1')
@RestApi(baseUrl: baseUrl)
@singleton
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  // ///////////////////++++++++++++++++/////////////////
  // ///////////////////    Auth api    /////////////////
  // ///////////////////++++++++++++++++/////////////////

  @POST(ApiEndPoints.signIn)
  Future<SignInDTO> signIn(@Body() SignInRequest data);

  @POST(ApiEndPoints.forgotPassword)
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST(ApiEndPoints.verifyResetCode)
  Future<void> verifyResetCode(@Body() VerifyResetCodeRequest request);

  @POST(ApiEndPoints.signUp)
  Future<SignupResponseModel> signup(@Body() SignupRequestModel body);

  @PUT(ApiEndPoints.resetPassword)
  Future<void> createNewPassword(@Body() CreateNewPasswordrequset request);
  @PATCH(ApiEndPoints.changePassword)
  Future<ChangePasswordModel> changePassword(
      @Body() ChangePasswordRequestModel data,
      @Header("Authorization") String token,
      );

  @GET(ApiEndPoints.mealsCategories)
  Future<MealCategoriesModel> getMealsCategories();

  @GET(ApiEndPoints.workoutTabs)
  Future<MusclesTabResponseModel> getMusclesTabs();

  @GET("${ApiEndPoints.muscles}/{id}")
  Future<MusclesDataResponseModel> getMusclesData(@Path('id') String id);
// ///////////////////++++++++++++++++/////////////////
// ///////////////////        /////////////////
// ///////////////////++++++++++++++++/////////////////
  @GET(ApiEndPoints.getAllExercise)
  Future<ExercisesResponseDTO> getAllExercises(
    // @Header('Accept-Language') String? language,
  );
  @GET(ApiEndPoints.getExercise)
  Future<ExerciseResponseDTO> getExercisesByMuscleAndDifficulty(
    @Query('primeMoverMuscleId') String muscleId,
    @Query('difficultyLevelId') String difficultyId,
  );

  @GET(ApiEndPoints.getRecommendExercise)
  Future<ExercisesResponseDTO> getRecommendExercises(
    @Query("targetMuscleGroupId") String targetMuscleGroupId,
    @Query("difficultyLevelId") String difficultyLevelId,
    @Query("limit") int limit,
  );
  @GET(ApiEndPoints.getLevelsEndPoint)
  Future<LevelsResponseDTO> getLevels(
      // @Header('Accept-Language') String? language,
      );

  ///////////////////++++++++++++++++/////////////////
  ///////////////////    Profile api    /////////////////
  ///////////////////++++++++++++++++/////////////////
  @PUT(ApiEndPoints.uploadProfilePhoto)
  @MultiPart()
  Future<void> uploadPhoto(@Body() FormData formData);

  @GET(ApiEndPoints.getProfileData)
  Future<ProfileDTO> getProfileData();

  @GET(ApiEndPoints.logout)
  Future<HttpResponse<void>> logout();
  @PUT(ApiEndPoints.editProfile)
  Future<EditProfileResponseDto> editProfile(@Body() Map<String, dynamic> data);
}
