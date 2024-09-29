import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repositories.dart';
import '../datasource/LoginRemoteDataSource.dart';
import '../model/LoginModel.dart';

class LoginRepositoriesImpl implements LoginRepositories {
  LoginRemoteDataSourceImpl loginRemoteDataSourceImpl;
  final NetworkInfo networkInfo;

  LoginRepositoriesImpl(
      {required this.loginRemoteDataSourceImpl, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> login(LoginEntity loginEntity) async {
    LoginModel loginModel =
        LoginModel(phone: loginEntity.phone, password: loginEntity.password);
    if (await networkInfo.isConnected) {
      try {
        final remote = await loginRemoteDataSourceImpl.login(loginModel);
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
