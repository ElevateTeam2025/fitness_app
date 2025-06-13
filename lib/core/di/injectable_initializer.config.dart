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

import '../../features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart'
    as _i951;
import '../../features/auth/forget_password/data/data_source/forget_password_remote_data_source_imp.dart'
    as _i527;
import '../../features/auth/forget_password/data/repo_imp/forget_password_repo_imp.dart'
    as _i1004;
import '../../features/auth/forget_password/domain/repo/forget_password_repo.dart'
    as _i484;
import '../../features/auth/forget_password/presentation/cubit/forget_password_cubit.dart'
    as _i231;
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
    gh.singleton<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i951.ForgetPasswordRemoteDataSource>(
      () => _i527.ForgetPasswordRemoteDataSourceImp(
        apiClient: gh<_i277.ApiClient>(),
      ),
    );
    gh.factory<_i484.ForgetPasswordRepo>(
      () => _i1004.ForgetPasswordRepoImp(
        forgetPasswordRemoteDataSource:
            gh<_i951.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i231.ForgetPasswordCubit>(
      () => _i231.ForgetPasswordCubit(gh<_i484.ForgetPasswordRepo>()),
    );
    return this;
  }
}

class _$DioProvider extends _i1013.DioProvider {}
