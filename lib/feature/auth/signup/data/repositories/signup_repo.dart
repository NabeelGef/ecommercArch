import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/signup_entities.dart';
import '../../domain/repositories/signup_repositories.dart';
import '../datasource/signup_remot_datasource.dart';
import '../model/signup_model.dart';

class SignupRepositoriesImpl implements SignupRepositories {
  SignupRemoteDataSourceImpl signupRemoteDataSourceImpl;
  final NetworkInfo networkInfo;
  SignupRepositoriesImpl(
      {required this.signupRemoteDataSourceImpl, required this.networkInfo});
  @override
  Future<Either<Failure, Unit>> signup(SignupEntity signupEntity) async {
    SignupModel signupModel = SignupModel(
        id: signupEntity.id,
        name: signupEntity.name,
        email: signupEntity.email,
        password: signupEntity.password,
        phone: signupEntity.phone,
        dateBirth: signupEntity.dateBirth);
    if (await networkInfo.isConnected) {
      try {
        final remot = await signupRemoteDataSourceImpl.signup(signupModel);
        return Right(remot);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
