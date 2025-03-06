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
import 'features/signup/data/datasources/user_datasource.dart' as _i917;
import 'features/signup/data/repositories/auth_repostoryImp.dart' as _i166;
import 'features/signup/domain/repositories/user_repository.dart' as _i1068;
import 'features/signup/domain/usecases/user_usecase.dart' as _i361;
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
  gh.lazySingleton<_i917.UserRemoteDataSource>(() =>
      _i917.UserRemoteDataSourceImp(firebaseAuth: gh<_i59.FirebaseAuth>()));
  gh.lazySingleton<_i75.NetworkInfo>(
      () => _i75.NetworkInfoImpl(gh<_i161.InternetConnection>()));
  gh.lazySingleton<_i1068.UserRepository>(() => _i166.UserRepositoryImp(
        gh<_i75.NetworkInfo>(),
        remoteDataSource: gh<_i917.UserRemoteDataSource>(),
      ));
  gh.lazySingleton<_i361.GetUserDataUsecase>(
      () => _i361.GetUserDataUsecase(gh<_i1068.UserRepository>()));
  gh.factory<_i889.SignupUserBloc>(
      () => _i889.SignupUserBloc(getAllData: gh<_i361.GetUserDataUsecase>()));
  return getIt;
}

class _$InjectionModules extends _i129.InjectionModules {}
