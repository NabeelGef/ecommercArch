import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/signup_entities.dart';
import '../repositories/signup_repositories.dart';

class SignupUseCase {
  SignupRepositories signupRepositories;

  SignupUseCase(this.signupRepositories);

  Future<Either<Failure, Unit>> call(SignupEntity signupEntity) {
    return signupRepositories.signup(signupEntity);
  }
}
