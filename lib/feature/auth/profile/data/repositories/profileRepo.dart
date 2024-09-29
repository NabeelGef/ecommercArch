import 'package:dartz/dartz.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/add_address_entitiy.dart';
import '../../domain/repositories/profile_repositories.dart';
import '../datasource/profile_local_datasource.dart';
import '../datasource/profile_remote_datasource.dart';
import '../model/addAddressModel.dart';
import '../model/profile_model.dart';

class ProfileRepo implements ProfileRepositories{
  ProfileLocalDataSource profileLocalDataSource;
  ProfileRemoteDataSource profileRemoteDataSource;
  NetworkInfo networkInfo;
  ProfileRepo({
    required this.profileLocalDataSource,
    required this.profileRemoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, ProfileModel>> getProfile(int id) async{
    if(await networkInfo.isConnected){
     try {
       final remote = await profileRemoteDataSource.getProfile(id);
       if (remote != null) {
         return Right(remote);
       } else {
         throw ServerException;
       }
     }on ServerException{
       return Left(ServerFailure());
     }
    }else{
      try {
        final local = await profileLocalDataSource.getProfileLocal();
        return Right(local);
      }on OnEmptyCacheException{
        return Left(OfflineFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addAddress(AddAddressEntity addAddressEntity) async {
    AddAddressModel addAddressModel =
    AddAddressModel(id: addAddressEntity.id,
        name: addAddressEntity.name,
        city: addAddressEntity.city,
        country: addAddressEntity.country,
        state: addAddressEntity.state,
        street1: addAddressEntity.street1,
        street2: addAddressEntity.street2,
        zipcode: addAddressEntity.zipcode,
        lat: addAddressEntity.lat,
        long: addAddressEntity.long);

    if (await networkInfo.isConnected) {
      try {
        final remote = await profileRemoteDataSource.AddAddress(addAddressModel);
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }

    throw UnimplementedError();
  }
}