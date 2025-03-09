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
import 'features/forget_password/data/datasources/user_forget_datasource.dart'
    as _i922;
import 'features/forget_password/data/repo/user_forget_repo_imp.dart' as _i359;
import 'features/forget_password/domain/repo/forget_user_repo.dart' as _i362;
import 'features/forget_password/domain/usecases/forget_user_usecase.dart'
    as _i408;
import 'features/forget_password/presentation/bloc/user_forget_bloc.dart'
    as _i881;
import 'features/login/data/datasources/user_login_datasources.dart' as _i995;
import 'features/login/data/repositories/user_login_repositoryimp.dart'
    as _i152;
import 'features/login/domain/repositories/user_login_repository.dart' as _i575;
import 'features/login/domain/usecases/user_login_usecase.dart' as _i45;
import 'features/login/presentation/bloc/login_bloc.dart' as _i1070;
import 'features/more/data/datasources/logout_remotedatasource.dart' as _i141;
import 'features/more/data/repo/logout_repo_imp.dart' as _i398;
import 'features/more/domain/repo/logout_repo.dart' as _i257;
import 'features/more/domain/usecases/logout_usecase.dart' as _i763;
import 'features/more/presentation/bloc/logout_bloc.dart' as _i554;
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
  gh.lazySingleton<_i141.LogoutRemoteDataSource>(() =>
      _i141.LogoutRemotedatasourceImp(firebaseAuth: gh<_i59.FirebaseAuth>()));
  gh.lazySingleton<_i994.UserSignUpRepository>(
      () => _i380.UserSignupRepositoryImp(
            gh<_i75.NetworkInfo>(),
            remoteDataSource: gh<_i835.UserSignupRemoteDataSource>(),
          ));
  gh.lazySingleton<_i922.UserForgetRemoteDataSource>(() =>
      _i922.UserForgetRemoteDataSourceImp(
          firebaseAuth: gh<_i59.FirebaseAuth>()));
  gh.lazySingleton<_i257.LogoutRepo>(() => _i398.LogoutRepoImp(
        networkInfo: gh<_i75.NetworkInfo>(),
        remoteDataSource: gh<_i141.LogoutRemoteDataSource>(),
      ));
  gh.lazySingleton<_i362.UserForgetRepo>(() => _i359.UserForgetRepoImp(
        gh<_i922.UserForgetRemoteDataSource>(),
        gh<_i75.NetworkInfo>(),
      ));
  gh.lazySingleton<_i575.UserLoginRepository>(
      () => _i152.UserLoginRepositoryImp(
            gh<_i995.UserLoginRemoteDataSource>(),
            gh<_i75.NetworkInfo>(),
          ));
  gh.lazySingleton<_i14.GetUserSignupDataUsecase>(
      () => _i14.GetUserSignupDataUsecase(gh<_i994.UserSignUpRepository>()));
  gh.lazySingleton<_i408.GetUserLoginDataUsecase>(
      () => _i408.GetUserLoginDataUsecase(gh<_i362.UserForgetRepo>()));
  gh.lazySingleton<_i45.GetUserLoginDataUsecase>(
      () => _i45.GetUserLoginDataUsecase(gh<_i575.UserLoginRepository>()));
  gh.factory<_i889.SignupUserBloc>(() =>
      _i889.SignupUserBloc(getAllData: gh<_i14.GetUserSignupDataUsecase>()));
  gh.factory<_i881.UserForgetBloc>(() =>
      _i881.UserForgetBloc(getAllData: gh<_i408.GetUserLoginDataUsecase>()));
  gh.lazySingleton<_i763.LogoutUsecase>(
      () => _i763.LogoutUsecase(gh<_i257.LogoutRepo>()));
  gh.factory<_i554.LogoutBloc>(
      () => _i554.LogoutBloc(logoutUsecase: gh<_i763.LogoutUsecase>()));
  gh.factory<_i1070.LoginBloc>(
      () => _i1070.LoginBloc(getAllData: gh<_i45.GetUserLoginDataUsecase>()));
  return getIt;
}

class _$InjectionModules extends _i129.InjectionModules {}
