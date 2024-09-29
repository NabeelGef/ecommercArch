import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/profile_entities.dart';
import '../repositories/profile_repositories.dart';

class ProfileUseCase{
 ProfileRepositories profileRepositories;

 ProfileUseCase(this.profileRepositories);

 Future<Either<Failure,ProfileEntity?>> call(int id){
   return profileRepositories.getProfile(id);
 }
}