import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exeptions.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/more/data/datasources/logout_remotedatasource.dart';
import 'package:e_commerce_app/features/more/domain/repo/logout_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LogoutRepo)
class LogoutRepoImp implements LogoutRepo {
  final NetworkInfo networkInfo;
  final LogoutRemoteDataSource remoteDataSource;

  LogoutRepoImp({required this.networkInfo, required this.remoteDataSource});
  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.getUserData();
        return const Right(unit);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return const Left(ServerFailure(Constants.ERROR_UNEXPECTED));
      }
    } else {
      return const Left(OfflineFailure(Constants.ERROR_NO_INTERNET));
    }
  }
}
