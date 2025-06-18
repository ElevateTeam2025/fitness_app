// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
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
import '../api/api_client.dart' as _i277;
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
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i1013.AuthInterceptor>(() => _i1013.AuthInterceptor());
    gh.factory<_i511.AuthLocalDataSource>(
      () => _i511.AuthLocalDataSourceImpl(),
    );
    gh.singleton<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
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
    gh.factory<_i951.ForgetPasswordRemoteDataSource>(
      () => _i527.ForgetPasswordRemoteDataSourceImp(
        apiClient: gh<_i277.ApiClient>(),
      ),
    );
    gh.factory<_i157.AuthRepository>(
      () => _i422.AuthRepositoryImpl(
        gh<_i931.AuthRemoteDataSource>(),
        gh<_i511.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i340.CreateNewPasswordCubit>(
      () => _i340.CreateNewPasswordCubit(
        createNewPasswordRepo: gh<_i500.CreateNewPasswordRepo>(),
      ),
    );
    gh.factory<_i751.SignupRepo>(
      () => _i268.SignupRepoImp(remoteDataSource: gh<_i809.SignupDataSource>()),
    );
    gh.factory<_i449.SignupUseCase>(
      () => _i449.SignupUseCase(gh<_i751.SignupRepo>()),
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
    gh.factory<_i174.SignInUseCase>(
      () => _i174.SignInUseCase(gh<_i157.AuthRepository>()),
    );
    gh.factory<_i1022.SignInViewModel>(
      () => _i1022.SignInViewModel(gh<_i174.SignInUseCase>()),
    );
    gh.factory<_i218.ForgetPasswordCubit>(
      () => _i218.ForgetPasswordCubit(gh<_i484.ForgetPasswordRepo>()),
    );
    return this;
  }
}

class _$DioProvider extends _i1013.DioProvider {}
