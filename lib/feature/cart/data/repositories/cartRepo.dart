import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/add_to_cart_entitity.dart';
import '../../domain/repositories/cart_repositories.dart';
import '../datasource/cart_local_datasource.dart';
import '../datasource/cart_remote_datasource.dart';
import '../models/add_to_cart_model.dart';
import '../models/cart_model.dart';

class CartRepo extends CartRepositories{
  CartRemoteDataSource cartRemoteDataSource;
  CartLocalDataSource cartLocalDataSource;
  NetworkInfo networkInfo;

  CartRepo({
    required this.cartRemoteDataSource,
    required this.cartLocalDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<CartModel>>> getAllCarts() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await cartRemoteDataSource.getAllCarts();
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await cartLocalDataSource.getAllCartsLocal();
        return Right(local);
      } on EmptyCacheFailure {
        return Left(OfflineFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addToCarts(AddToCartEntity cartEntity) async {
   AddToCartModel addToCartModel = AddToCartModel(productId: cartEntity.productId,
       quantity: cartEntity.quantity);
   if (await networkInfo.isConnected) {
     try {
       final remote = await cartRemoteDataSource.addToCarts(addToCartModel);
       return Right(remote);
     } on ServerException {
       return Left(ServerFailure());
     }
   } else {
     return Left(OfflineFailure());
   }
  }
}