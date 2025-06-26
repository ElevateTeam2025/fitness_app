// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_gemini/flutter_gemini.dart' as _i257;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/forget_password/data/data_source/create_new_password_data_source.dart'
    as _i674;
import '../../features/auth/forget_password/data/data_source/create_new_password_data_source_imp.dart'
    as _i1032;
import '../../features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart'
    as _i951;
import '../../features/auth/forget_password/data/data_source/forget_password_remote_data_source_imp.dart'
    as _i527;
import '../../features/auth/forget_password/data/data_source/verify_reset_code_remote_data_source.dart'
    as _i274;
import '../../features/auth/forget_password/data/data_source/verify_reset_code_remote_data_source_imp.dart'
    as _i370;
import '../../features/auth/forget_password/data/repo_imp/create_new_password_repo_imp.dart'
    as _i438;
import '../../features/auth/forget_password/data/repo_imp/forget_password_repo_imp.dart'
    as _i1004;
import '../../features/auth/forget_password/data/repo_imp/verify_reset_code_repo_imp.dart'
    as _i363;
import '../../features/auth/forget_password/domain/repo/create_new_password_repo.dart'
    as _i500;
import '../../features/auth/forget_password/domain/repo/forget_password_repo.dart'
    as _i484;
import '../../features/auth/forget_password/domain/repo/verify_reset_code_repo.dart'
    as _i640;
import '../../features/auth/forget_password/presentation/cubits/create_new_password_cubit/create_new_password_cubit.dart'
    as _i340;
import '../../features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart'
    as _i218;
import '../../features/auth/forget_password/presentation/cubits/verify_reset_code_cubit/verify_reset_code_cubit.dart'
    as _i829;
import '../../features/auth/sign_in/data/data_source/auth_local_data_source.dart'
    as _i511;
import '../../features/auth/sign_in/data/data_source/auth_remote_data_source.dart'
    as _i931;
import '../../features/auth/sign_in/data/repository_imp/auth_repository_imp.dart'
    as _i422;
import '../../features/auth/sign_in/domain/repository/auth_repository.dart'
    as _i157;
import '../../features/auth/sign_in/domain/use_case/sign_in_use_case.dart'
    as _i174;
import '../../features/auth/sign_in/presentation/cubit/sign_in_cubit/sign_in_view_model.dart'
    as _i1022;
import '../../features/auth/sign_up/data/data_source/signup_data_source.dart'
    as _i809;
import '../../features/auth/sign_up/data/repo_impl/signup_repo_impl.dart'
    as _i268;
import '../../features/auth/sign_up/domain/repo/signup_repo.dart' as _i751;
import '../../features/auth/sign_up/domain/use_case/signup_use_case.dart'
    as _i449;
import '../../features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart'
    as _i1067;
import '../../features/chatbot/data/data_source/chatbot_remote_data_source.dart'
    as _i676;
import '../../features/chatbot/data/repositoey_impl/chatbot_repository_impl.dart'
    as _i110;
import '../../features/chatbot/domain/repository/chatbot_repository.dart'
    as _i1027;
import '../../features/chatbot/domain/use_case/chatbot_use_case.dart' as _i324;
import '../../features/chatbot/presentation/manager/chatbot_view_model.dart'
    as _i882;
import '../../features/Exercise/data/data_source/exercise_remote_data_source.dart'
    as _i461;
import '../../features/Exercise/data/repository_imp/exercise_repository_imp.dart'
    as _i302;
import '../../features/Exercise/domain/repository/exercise_repository.dart'
    as _i828;
import '../../features/Exercise/domain/use_case/exercise_use_case.dart'
    as _i278;
import '../../features/Exercise/presentation/cubit/sign_in_cubit/exercise_view_model.dart'
    as _i960;
import '../../features/home/data/data_source/home_data_source.dart' as _i68;
import '../../features/home/data/repo_imp/home_repository_impl.dart' as _i886;
import '../../features/home/domain/repo/home_repo.dart' as _i280;
import '../../features/home/domain/use_case/home_use_case.dart' as _i353;
import '../../features/home/presentation/cubit/get_meals_categories_cubit/get_meals_categories_cubit.dart'
    as _i463;
import '../../features/home/presentation/cubit/recommendation_cubit/recommendation_cubit.dart'
    as _i540;
import '../../features/home/presentation/cubit/workout_cubit/workout_cubit.dart'
    as _i846;
import '../../features/meal_details/data/data_source/meal_details_remote_data_source.dart'
    as _i557;
import '../../features/meal_details/data/data_source/meal_details_remote_data_source_impl.dart'
    as _i90;
import '../../features/meal_details/data/repo_impl/get_meal_details_repo_impl.dart'
    as _i193;
import '../../features/meal_details/domain/repo/get_meal_deatils_repo.dart'
    as _i593;
import '../../features/meal_details/domain/use_case/get_meal_details_use_case.dart'
    as _i622;
import '../../features/meal_details/presentation/cubits/get_meal_details_cubit/get_meal_details_cubit.dart'
    as _i480;
import '../../features/meals_categories/data/data_source/get_meals_by_category_data_source.dart'
    as _i1015;
import '../../features/meals_categories/data/data_source/get_meals_by_category_data_source_imp.dart'
    as _i575;
import '../../features/meals_categories/data/data_source/get_meals_categories_data_source.dart'
    as _i472;
import '../../features/meals_categories/data/data_source/get_meals_categories_data_source_imp.dart'
    as _i81;
import '../../features/meals_categories/data/repo_imp/get_meals_by_category_repo_imp.dart'
    as _i195;
import '../../features/meals_categories/data/repo_imp/get_meals_categories_repo_imp.dart'
    as _i396;
import '../../features/meals_categories/domain/repo/get_meals_by_category_repo.dart'
    as _i736;
import '../../features/meals_categories/domain/repo/get_meals_categories_repo.dart'
    as _i982;
import '../../features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_cubit.dart'
    as _i271;
import '../../features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_cubit.dart'
    as _i1032;
import '../../features/onboarding/presentation/cubits/change_onboarding_view_model.dart'
    as _i656;
import '../../features/worksout/data/data_source/workout_remote_data_source.dart'
    as _i801;
import '../../features/worksout/data/repository_impl/workout_repository_impl.dart'
    as _i1016;
import '../../features/worksout/domain/repository/workout_repository.dart'
    as _i923;
import '../../features/worksout/domain/use_case/workout_use_case.dart' as _i267;
import '../../features/worksout/presentation/manager/workout_view_model.dart'
    as _i514;
import '../api/api_client.dart' as _i277;
import '../api/meals_api_client.dart' as _i512;
import '../api/network_factory.dart' as _i1013;
import '../services/gemini_service.dart' as _i846;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioProvider = _$DioProvider();
    gh.factory<_i846.GeminiService>(() => _i846.GeminiService());
    gh.factory<_i656.ChangeOnboardingViewModel>(
      () => _i656.ChangeOnboardingViewModel(),
    );
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i1013.AuthInterceptor>(() => _i1013.AuthInterceptor());
    gh.factory<_i511.AuthLocalDataSource>(
      () => _i511.AuthLocalDataSourceImpl(),
    );
    gh.singleton<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
    gh.singleton<_i512.MealsApiClient>(
      () => _i512.MealsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i1015.GetMealsByCategoryDataSource>(
      () => _i575.GetMealsByCategoryDataSourceImp(
        mealsApiClient: gh<_i512.MealsApiClient>(),
      ),
    );
    gh.factory<_i931.AuthRemoteDataSource>(
      () => _i931.AuthRemoteDataSourceImpl(gh<_i277.ApiClient>()),
    );
    gh.factory<_i674.CreateNewPasswordDataSource>(
      () => _i1032.CreateNewPasswordDataSourceImp(
        apiClient: gh<_i277.ApiClient>(),
      ),
    );
    gh.factory<_i274.VerifyResetCodeRemoteDataSource>(
      () => _i370.VerifyResetCodeRemoteDataSourceImp(
        apiClient: gh<_i277.ApiClient>(),
      ),
    );
    gh.factory<_i801.WorkoutRemoteDataSource>(
      () => _i801.WorkoutRemoteDataSourceImpl(gh<_i277.ApiClient>()),
    );
    gh.factory<_i676.ChatbotRemoteDataSource>(
      () => _i676.ChatbotRemoteDataSourceImpl(gh<_i257.Gemini>()),
    );
    gh.factory<_i809.SignupDataSource>(
      () => _i809.SignupRemoteDataSourceImpl(gh<_i277.ApiClient>()),
    );
    gh.factory<_i640.VerifyResetCodeRepo>(
      () => _i363.VerifyResetCodeRepoImp(
        verifyResetCodeRemoteDataSource:
            gh<_i274.VerifyResetCodeRemoteDataSource>(),
      ),
    );
    gh.factory<_i829.VerifyResetCodeCubit>(
      () => _i829.VerifyResetCodeCubit(
        verifyResetCodeRepo: gh<_i640.VerifyResetCodeRepo>(),
      ),
    );
    gh.factory<_i500.CreateNewPasswordRepo>(
      () => _i438.CreateNewPasswordRepoImp(
        createNewPasswordDataSource: gh<_i674.CreateNewPasswordDataSource>(),
      ),
    );
    gh.factory<_i736.GetMealsByCategoryRepo>(
      () => _i195.GetMealsByCategoryRepoImp(
        getMealsByCategoryDataSource: gh<_i1015.GetMealsByCategoryDataSource>(),
      ),
    );
    gh.factory<_i557.MealDetailsRemoteDataSource>(
      () => _i90.MealDetailsRemoteDataSourceImpl(gh<_i512.MealsApiClient>()),
    );
    gh.factory<_i951.ForgetPasswordRemoteDataSource>(
      () => _i527.ForgetPasswordRemoteDataSourceImp(
        apiClient: gh<_i277.ApiClient>(),
      ),
    );
    gh.factory<_i271.GetMealsByCategoryCubit>(
      () => _i271.GetMealsByCategoryCubit(gh<_i736.GetMealsByCategoryRepo>()),
    );
    gh.factory<_i1027.ChatbotRepository>(
      () => _i110.ChatbotRepositoryImpl(gh<_i676.ChatbotRemoteDataSource>()),
    );
    gh.factory<_i68.HomeDataSource>(
      () => _i68.HomeDataSourceImp(
        gh<_i277.ApiClient>(),
        gh<_i512.MealsApiClient>(),
      ),
    );
    gh.factory<_i593.GetMealDetailsRepo>(
      () =>
          _i193.GetMealDetailsRepoImpl(gh<_i557.MealDetailsRemoteDataSource>()),
    );
    gh.factory<_i461.ExerciseRemoteDataSource>(
      () => _i461.ExerciseRemoteDataSourceImpl(gh<_i277.ApiClient>()),
    );
    gh.factory<_i472.GetMealsCategoriesDataSource>(
      () => _i81.GetMealsCategoriesDataSourceImp(
        mealsApiClient: gh<_i512.MealsApiClient>(),
      ),
    );
    gh.factory<_i280.HomeRepo>(
      () => _i886.HomeRepoImpl(gh<_i68.HomeDataSource>()),
    );
    gh.factory<_i157.AuthRepository>(
      () => _i422.AuthRepositoryImpl(
        gh<_i931.AuthRemoteDataSource>(),
        gh<_i511.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i828.ExerciseRepository>(
      () => _i302.ExerciseRepositoryImpl(gh<_i461.ExerciseRemoteDataSource>()),
    );
    gh.factory<_i923.WorkoutRepository>(
      () => _i1016.WorkoutRepositoryImpl(gh<_i801.WorkoutRemoteDataSource>()),
    );
    gh.factory<_i340.CreateNewPasswordCubit>(
      () => _i340.CreateNewPasswordCubit(
        createNewPasswordRepo: gh<_i500.CreateNewPasswordRepo>(),
      ),
    );
    gh.factory<_i622.GetMealDetailsUseCase>(
      () => _i622.GetMealDetailsUseCase(gh<_i593.GetMealDetailsRepo>()),
    );
    gh.factory<_i751.SignupRepo>(
      () => _i268.SignupRepoImp(remoteDataSource: gh<_i809.SignupDataSource>()),
    );
    gh.factory<_i480.GetMealDetailsCubit>(
      () => _i480.GetMealDetailsCubit(gh<_i622.GetMealDetailsUseCase>()),
    );
    gh.factory<_i449.SignupUseCase>(
      () => _i449.SignupUseCase(gh<_i751.SignupRepo>()),
    );
    gh.factory<_i982.GetMealsCategoriesRepo>(
      () => _i396.GetMealsCategoriesRepoImp(
        getMealsCategoriesDataSource: gh<_i472.GetMealsCategoriesDataSource>(),
      ),
    );
    gh.factory<_i267.WorkoutUseCase>(
      () => _i267.WorkoutUseCase(gh<_i923.WorkoutRepository>()),
    );
    gh.factory<_i324.ChatbotUseCase>(
      () => _i324.ChatbotUseCase(gh<_i1027.ChatbotRepository>()),
    );
    gh.factory<_i1067.SignupCubit>(
      () => _i1067.SignupCubit(gh<_i449.SignupUseCase>()),
    );
    gh.factory<_i484.ForgetPasswordRepo>(
      () => _i1004.ForgetPasswordRepoImp(
        forgetPasswordRemoteDataSource:
            gh<_i951.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i882.ChatbotViewModel>(
      () => _i882.ChatbotViewModel(gh<_i324.ChatbotUseCase>()),
    );
    gh.factory<_i353.HomeUseCase>(
      () => _i353.HomeUseCase(gh<_i280.HomeRepo>()),
    );
    gh.factory<_i174.SignInUseCase>(
      () => _i174.SignInUseCase(gh<_i157.AuthRepository>()),
    );
    gh.factory<_i278.ExercisesUseCase>(
      () => _i278.ExercisesUseCase(gh<_i828.ExerciseRepository>()),
    );
    gh.factory<_i1022.SignInViewModel>(
      () => _i1022.SignInViewModel(gh<_i174.SignInUseCase>()),
    );
    gh.factory<_i463.GetHomeMealsCategoriesCubit>(
      () => _i463.GetHomeMealsCategoriesCubit(gh<_i353.HomeUseCase>()),
    );
    gh.factory<_i1032.GetMealsCategoriesCubit>(
      () => _i1032.GetMealsCategoriesCubit(
        getMealsCategoriesRepo: gh<_i982.GetMealsCategoriesRepo>(),
      ),
    );
    gh.factory<_i514.WorkoutViewModel>(
      () => _i514.WorkoutViewModel(gh<_i267.WorkoutUseCase>()),
    );
    gh.factory<_i218.ForgetPasswordCubit>(
      () => _i218.ForgetPasswordCubit(gh<_i484.ForgetPasswordRepo>()),
    );
    gh.factory<_i960.ExerciseViewModel>(
      () => _i960.ExerciseViewModel(gh<_i278.ExercisesUseCase>()),
    );
    gh.factory<_i540.RecommendationCubit>(
      () => _i540.RecommendationCubit(gh<_i353.HomeUseCase>()),
    );
    gh.factory<_i846.WorkoutCubit>(
      () => _i846.WorkoutCubit(gh<_i353.HomeUseCase>()),
    );
    return this;
  }
}

class _$DioProvider extends _i1013.DioProvider {}
