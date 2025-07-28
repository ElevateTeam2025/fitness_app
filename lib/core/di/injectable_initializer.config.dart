// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/change_password/date/data_sourse/change_pasword_data_source.dart'
    as _i817;
import '../../features/auth/change_password/date/repo_ipm/change_password_repositoy_impl.dart'
    as _i281;
import '../../features/auth/change_password/domin/repo/reset_password_repository.dart'
    as _i225;
import '../../features/auth/change_password/domin/use_case/change_password_use_case.dart'
    as _i827;
import '../../features/auth/change_password/presentation/cubit/change_password_cubit/change_password_view-model.dart'
    as _i1060;
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
import '../../features/chatbot/data/data_source/chatbot_local_data_source.dart'
    as _i545;
import '../../features/chatbot/data/data_source/chatbot_remote_data_source.dart'
    as _i676;
import '../../features/chatbot/data/data_source/local_data_source/local_data_source.dart'
    as _i596;
import '../../features/chatbot/data/data_source/remote_data_source/remote_data_source.dart'
    as _i456;
import '../../features/chatbot/data/model/chat_history_model.dart' as _i965;
import '../../features/chatbot/data/repositoey_impl/chatbot_repository_impl.dart'
    as _i110;
import '../../features/chatbot/data/repositoey_impl/repo/chat_repo_impl.dart'
    as _i129;
import '../../features/chatbot/domain/repository/chatbot_repository.dart'
    as _i1027;
import '../../features/chatbot/domain/repository/repo/chat_repository.dart'
    as _i227;
import '../../features/chatbot/domain/use_case/chat_use_case/chat_use_case.dart'
    as _i668;
import '../../features/chatbot/domain/use_case/chatbot_use_case.dart' as _i324;
import '../../features/chatbot/presentation/manager/bloc/chat_bloc.dart'
    as _i634;
import '../../features/chatbot/presentation/manager/chatbot_view_model.dart'
    as _i882;
import '../../features/edit_profile/data/data_source/edit_profile_remote_data_source/edit_profile_remote_data_source.dart'
    as _i815;
import '../../features/edit_profile/data/data_source/edit_profile_remote_data_source/edit_profile_remote_data_source_impl.dart'
    as _i905;
import '../../features/edit_profile/data/data_source/upload_photo_remote_data_source.dart'
    as _i415;
import '../../features/edit_profile/data/data_source/upload_photo_remote_data_source_imp.dart'
    as _i870;
import '../../features/edit_profile/data/repo_imp/edit_profile_repo_impl.dart'
    as _i49;
import '../../features/edit_profile/data/repo_imp/upload_photo_repo_imp.dart'
    as _i836;
import '../../features/edit_profile/domain/repo/edit_profile_repo.dart'
    as _i642;
import '../../features/edit_profile/domain/repo/upload_photo_repo.dart'
    as _i646;
import '../../features/edit_profile/domain/use_case/edit_profile_use_case.dart'
    as _i226;
import '../../features/edit_profile/presentation/cubits/edit_profile_cubit/edit_profile_view_model.dart'
    as _i98;
import '../../features/edit_profile/presentation/cubits/upload_photo_cubit/upload_photo_cubit.dart'
    as _i1058;
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
import '../../features/profile/data/data_source/profile_local_data_source.dart'
    as _i693;
import '../../features/profile/data/data_source/profile_remote_data_source.dart'
    as _i998;
import '../../features/profile/data/repository_imp/profile_screen_repository_imp.dart'
    as _i149;
import '../../features/profile/domain/repository/profile_screen_repository.dart'
    as _i763;
import '../../features/profile/domain/use_case/profile_screen_use_case.dart'
    as _i1065;
import '../../features/profile/presentation/cubit/profile_view_model.dart'
    as _i516;
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
import '../services/hive_service.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    gh.factory<_i846.GeminiService>(() => _i846.GeminiService());
    gh.factory<_i656.ChangeOnboardingViewModel>(
        () => _i656.ChangeOnboardingViewModel());
    gh.singleton<_i1047.HiveService>(() => _i1047.HiveService());
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i1013.AuthInterceptor>(() => _i1013.AuthInterceptor());
    gh.factory<_i511.AuthLocalDataSource>(
        () => _i511.AuthLocalDataSourceImpl());
    gh.factory<_i545.ChatbotLocalDataSource>(() =>
        _i545.ChatbotLocalDataSourceImpl(
            gh<_i979.Box<_i965.ChatHistoryModel>>()));
    gh.singleton<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
    gh.singleton<_i512.MealsApiClient>(
        () => _i512.MealsApiClient(gh<_i361.Dio>()));
    gh.factory<_i998.ProfileRemoteDataSource>(
        () => _i998.ProfileRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i1015.GetMealsByCategoryDataSource>(() =>
        _i575.GetMealsByCategoryDataSourceImp(
            mealsApiClient: gh<_i512.MealsApiClient>()));
    gh.factory<_i931.AuthRemoteDataSource>(
        () => _i931.AuthRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i596.LocalDataDataSource>(() => _i596.LocalDataSourceImpl());
    gh.factory<_i415.UploadPhotoRemoteDataSource>(() =>
        _i870.UploadPhotoRemoteDataSourceImp(apiClient: gh<_i277.ApiClient>()));
    gh.factory<_i676.ChatbotRemoteDataSource>(
        () => _i676.ChatbotRemoteDataSourceImpl());
    gh.factory<_i674.CreateNewPasswordDataSource>(() =>
        _i1032.CreateNewPasswordDataSourceImp(
            apiClient: gh<_i277.ApiClient>()));
    gh.factory<_i274.VerifyResetCodeRemoteDataSource>(() =>
        _i370.VerifyResetCodeRemoteDataSourceImp(
            apiClient: gh<_i277.ApiClient>()));
    gh.factory<_i801.WorkoutRemoteDataSource>(
        () => _i801.WorkoutRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i693.ProfileLocalDataSource>(
        () => _i693.ProfileLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i1027.ChatbotRepository>(() => _i110.ChatbotRepositoryImpl(
          gh<_i676.ChatbotRemoteDataSource>(),
          gh<_i545.ChatbotLocalDataSource>(),
        ));
    gh.factory<_i456.RemoteDataSource>(
        () => _i456.RemoteDataSourceImpl(gh<_i846.GeminiService>()));
    gh.factory<_i809.SignupDataSource>(
        () => _i809.SignupRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i640.VerifyResetCodeRepo>(() => _i363.VerifyResetCodeRepoImp(
        verifyResetCodeRemoteDataSource:
            gh<_i274.VerifyResetCodeRemoteDataSource>()));
    gh.factory<_i324.ChatbotUseCase>(
        () => _i324.ChatbotUseCase(gh<_i1027.ChatbotRepository>()));
    gh.factory<_i882.ChatbotViewModel>(
        () => _i882.ChatbotViewModel(gh<_i324.ChatbotUseCase>()));
    gh.factory<_i829.VerifyResetCodeCubit>(() => _i829.VerifyResetCodeCubit(
        verifyResetCodeRepo: gh<_i640.VerifyResetCodeRepo>()));
    gh.factory<_i500.CreateNewPasswordRepo>(() =>
        _i438.CreateNewPasswordRepoImp(
            createNewPasswordDataSource:
                gh<_i674.CreateNewPasswordDataSource>()));
    gh.factory<_i736.GetMealsByCategoryRepo>(() =>
        _i195.GetMealsByCategoryRepoImp(
            getMealsByCategoryDataSource:
                gh<_i1015.GetMealsByCategoryDataSource>()));
    gh.factory<_i557.MealDetailsRemoteDataSource>(
        () => _i90.MealDetailsRemoteDataSourceImpl(gh<_i512.MealsApiClient>()));
    gh.factory<_i951.ForgetPasswordRemoteDataSource>(() =>
        _i527.ForgetPasswordRemoteDataSourceImp(
            apiClient: gh<_i277.ApiClient>()));
    gh.factory<_i271.GetMealsByCategoryCubit>(() =>
        _i271.GetMealsByCategoryCubit(gh<_i736.GetMealsByCategoryRepo>()));
    gh.factory<_i68.HomeDataSource>(() => _i68.HomeDataSourceImp(
          gh<_i277.ApiClient>(),
          gh<_i512.MealsApiClient>(),
        ));
    gh.factory<_i593.GetMealDetailsRepo>(() =>
        _i193.GetMealDetailsRepoImpl(gh<_i557.MealDetailsRemoteDataSource>()));
    gh.factory<_i815.EditProfileRemoteDataSource>(
        () => _i905.EditProfileRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i227.ChatRepository>(() => _i129.ChatRepositoryImpl(
          localDataSource: gh<_i596.LocalDataDataSource>(),
          remoteDataSource: gh<_i456.RemoteDataSource>(),
        ));
    gh.factory<_i763.ProfileRepository>(() => _i149.ProfileRepositoryImpl(
          gh<_i998.ProfileRemoteDataSource>(),
          gh<_i693.ProfileLocalDataSource>(),
        ));
    gh.factory<_i461.ExerciseRemoteDataSource>(
        () => _i461.ExerciseRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i817.ChangePasswordDataSource>(
        () => _i817.ChangePasswordDataSourceImp(gh<_i277.ApiClient>()));
    gh.factory<_i472.GetMealsCategoriesDataSource>(() =>
        _i81.GetMealsCategoriesDataSourceImp(
            mealsApiClient: gh<_i512.MealsApiClient>()));
    gh.factory<_i646.UploadPhotoRepo>(() =>
        _i836.UploadPhotoRepoImp(gh<_i415.UploadPhotoRemoteDataSource>()));
    gh.factory<_i280.HomeRepo>(
        () => _i886.HomeRepoImpl(gh<_i68.HomeDataSource>()));
    gh.factory<_i157.AuthRepository>(() => _i422.AuthRepositoryImpl(
          gh<_i931.AuthRemoteDataSource>(),
          gh<_i511.AuthLocalDataSource>(),
        ));
    gh.factory<_i828.ExerciseRepository>(() =>
        _i302.ExerciseRepositoryImpl(gh<_i461.ExerciseRemoteDataSource>()));
    gh.factory<_i923.WorkoutRepository>(() =>
        _i1016.WorkoutRepositoryImpl(gh<_i801.WorkoutRemoteDataSource>()));
    gh.factory<_i340.CreateNewPasswordCubit>(() => _i340.CreateNewPasswordCubit(
        createNewPasswordRepo: gh<_i500.CreateNewPasswordRepo>()));
    gh.factory<_i622.GetMealDetailsUseCase>(
        () => _i622.GetMealDetailsUseCase(gh<_i593.GetMealDetailsRepo>()));
    gh.factory<_i751.SignupRepo>(() =>
        _i268.SignupRepoImp(remoteDataSource: gh<_i809.SignupDataSource>()));
    gh.factory<_i480.GetMealDetailsCubit>(
        () => _i480.GetMealDetailsCubit(gh<_i622.GetMealDetailsUseCase>()));
    gh.factory<_i449.SignupUseCase>(
        () => _i449.SignupUseCase(gh<_i751.SignupRepo>()));
    gh.factory<_i1065.ProfileUseCase>(
        () => _i1065.ProfileUseCase(gh<_i763.ProfileRepository>()));
    gh.factory<_i982.GetMealsCategoriesRepo>(() =>
        _i396.GetMealsCategoriesRepoImp(
            getMealsCategoriesDataSource:
                gh<_i472.GetMealsCategoriesDataSource>()));
    gh.factory<_i642.EditProfileRepo>(() =>
        _i49.EditProfileRepoImpl(gh<_i815.EditProfileRemoteDataSource>()));
    gh.factory<_i267.WorkoutUseCase>(
        () => _i267.WorkoutUseCase(gh<_i923.WorkoutRepository>()));
    gh.factory<_i225.ChangePasswordRepository>(() =>
        _i281.ChangePasswordRepositoryImp(
            gh<_i817.ChangePasswordDataSource>()));
    gh.factory<_i1067.SignupCubit>(
        () => _i1067.SignupCubit(gh<_i449.SignupUseCase>()));
    gh.factory<_i484.ForgetPasswordRepo>(() => _i1004.ForgetPasswordRepoImp(
        forgetPasswordRemoteDataSource:
            gh<_i951.ForgetPasswordRemoteDataSource>()));
    gh.factory<_i353.HomeUseCase>(
        () => _i353.HomeUseCase(gh<_i280.HomeRepo>()));
    gh.factory<_i668.ChatUseCase>(
        () => _i668.ChatUseCase(gh<_i227.ChatRepository>()));
    gh.factory<_i174.SignInUseCase>(
        () => _i174.SignInUseCase(gh<_i157.AuthRepository>()));
    gh.factory<_i827.ChangePasswordUseCase>(() =>
        _i827.ChangePasswordUseCase(gh<_i225.ChangePasswordRepository>()));
    gh.factory<_i278.ExercisesUseCase>(
        () => _i278.ExercisesUseCase(gh<_i828.ExerciseRepository>()));
    gh.factory<_i1060.ChangePasswordViewModel>(() =>
        _i1060.ChangePasswordViewModel(gh<_i827.ChangePasswordUseCase>()));
    gh.factory<_i1022.SignInViewModel>(
        () => _i1022.SignInViewModel(gh<_i174.SignInUseCase>()));
    gh.factory<_i1058.UploadPhotoCubit>(
        () => _i1058.UploadPhotoCubit(gh<_i646.UploadPhotoRepo>()));
    gh.factory<_i463.GetHomeMealsCategoriesCubit>(
        () => _i463.GetHomeMealsCategoriesCubit(gh<_i353.HomeUseCase>()));
    gh.factory<_i1032.GetMealsCategoriesCubit>(() =>
        _i1032.GetMealsCategoriesCubit(
            getMealsCategoriesRepo: gh<_i982.GetMealsCategoriesRepo>()));
    gh.factory<_i226.EditProfileUseCase>(
        () => _i226.EditProfileUseCase(gh<_i642.EditProfileRepo>()));
    gh.factory<_i514.WorkoutViewModel>(
        () => _i514.WorkoutViewModel(gh<_i267.WorkoutUseCase>()));
    gh.factory<_i218.ForgetPasswordCubit>(
        () => _i218.ForgetPasswordCubit(gh<_i484.ForgetPasswordRepo>()));
    gh.factory<_i960.ExerciseViewModel>(
        () => _i960.ExerciseViewModel(gh<_i278.ExercisesUseCase>()));
    gh.factory<_i516.ProfileViewModel>(
        () => _i516.ProfileViewModel(gh<_i1065.ProfileUseCase>()));
    gh.factory<_i98.EditProfileViewModel>(
        () => _i98.EditProfileViewModel(gh<_i226.EditProfileUseCase>()));
    gh.factory<_i540.RecommendationCubit>(
        () => _i540.RecommendationCubit(gh<_i353.HomeUseCase>()));
    gh.factory<_i846.WorkoutCubit>(
        () => _i846.WorkoutCubit(gh<_i353.HomeUseCase>()));
    gh.factory<_i634.ChatBloc>(
        () => _i634.ChatBloc(useCase: gh<_i668.ChatUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i1013.DioProvider {}
