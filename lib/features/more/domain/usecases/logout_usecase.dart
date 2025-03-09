import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/faliures.dart';
import 'package:e_commerce_app/features/more/domain/repo/logout_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutUsecase {
  final LogoutRepo repo;

  LogoutUsecase(this.repo);

  Future<Either<Failure, Unit>> call() async {
    return await repo.logout();
  }
}
