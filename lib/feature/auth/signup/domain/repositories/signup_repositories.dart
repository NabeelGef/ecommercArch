import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/signup_entities.dart';

abstract class SignupRepositories {
  Future<Either<Failure, Unit>> signup(SignupEntity signupEntity);
}
