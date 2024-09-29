import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/add_address_entitiy.dart';
import '../repositories/profile_repositories.dart';

class AddAddressUseCase{
  ProfileRepositories profileRepositories;

  AddAddressUseCase(this.profileRepositories);

  Future<Either<Failure,Unit>> call(AddAddressEntity addAddressEntity){
    return profileRepositories.addAddress(addAddressEntity);
  }
}