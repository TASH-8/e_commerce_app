// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;

import 'core/network/network_info.dart' as _i75;
import 'features/login/data/datasources/user_login_datasources.dart' as _i995;
import 'features/login/data/repositories/user_login_repository.dart' as _i872;
import 'features/login/domain/repositories/user_login_repository.dart' as _i575;
import 'features/login/domain/usecases/user_login_usecase.dart' as _i45;
import 'features/login/presentation/bloc/login_bloc.dart' as _i1070;
import 'features/signup/data/datasources/user_signup_datasource.dart' as _i835;
import 'features/signup/data/repositories/user_signup_repostoryImp.dart'
    as _i380;
import 'features/signup/domain/repositories/user_signup_repository.dart'
    as _i994;
import 'features/signup/domain/usecases/user_signup_usecase.dart' as _i14;
import 'features/signup/presentation/bloc/signup_user_bloc.dart' as _i889;
import 'injectable_modules.dart' as _i129;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModules = _$InjectionModules();
  gh.lazySingleton<_i161.InternetConnection>(
      () => injectionModules.connectionChecker);
  gh.lazySingleton<_i835.UserSignupRemoteDataSource>(() =>
      _i835.UserSignupRemoteDataSourceImp(
          firebaseAuth: gh<_i59.FirebaseAuth>()));
  gh.lazySingleton<_i995.UserLoginRemoteDataSource>(() =>
      _i995.UserSignupRemoteDataSourceImp(
          firebaseAuth: gh<_i59.FirebaseAuth>()));
  gh.lazySingleton<_i75.NetworkInfo>(
      () => _i75.NetworkInfoImpl(gh<_i161.InternetConnection>()));
  gh.lazySingleton<_i994.UserSignUpRepository>(
      () => _i380.UserSignupRepositoryImp(
            gh<_i75.NetworkInfo>(),
            remoteDataSource: gh<_i835.UserSignupRemoteDataSource>(),
          ));
  gh.lazySingleton<_i14.GetUserSignupDataUsecase>(
      () => _i14.GetUserSignupDataUsecase(gh<_i994.UserSignUpRepository>()));
  gh.lazySingleton<_i575.UserLoginRepository>(
      () => _i872.UserLoginRepositoryImp(
            gh<_i995.UserLoginRemoteDataSource>(),
            gh<_i75.NetworkInfo>(),
          ));
  gh.lazySingleton<_i45.GetUserLoginDataUsecase>(
      () => _i45.GetUserLoginDataUsecase(gh<_i575.UserLoginRepository>()));
  gh.factory<_i889.SignupUserBloc>(() =>
      _i889.SignupUserBloc(getAllData: gh<_i14.GetUserSignupDataUsecase>()));
  gh.factory<_i1070.LoginBloc>(
      () => _i1070.LoginBloc(getAllData: gh<_i45.GetUserLoginDataUsecase>()));
  return getIt;
}

class _$InjectionModules extends _i129.InjectionModules {}
