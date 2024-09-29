import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/add_address_entitiy.dart';
import '../entities/profile_entities.dart';

abstract class ProfileRepositories{
  Future<Either<Failure,ProfileEntity>> getProfile(int id);
  Future<Either<Failure,Unit>> addAddress(AddAddressEntity addAddressEntity);
}