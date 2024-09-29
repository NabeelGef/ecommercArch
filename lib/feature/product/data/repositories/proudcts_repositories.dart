import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/product_repositories.dart';
import '../datasource/products_local_data_source.dart';
import '../datasource/products_remote_data_source.dart';
import '../model/products_model.dart';

class ProductsRepositoriesImpl implements ProductsRepo {
  final ProductsRemoteDataSource productsRemoteDataSource;
  final ProductsLocalDataSource productsLocalDataSource;
  final NetworkInfo networkInfo;

  ProductsRepositoriesImpl(
      {required this.productsRemoteDataSource,
      required this.productsLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<ProductsModel>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await productsRemoteDataSource.getAllProducts();
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await productsLocalDataSource.getAllProductsCached();
        return Right(local);
      } on EmptyCacheFailure {
        return Left(OfflineFailure());
      }
    }
  }

  @override
  Future<Either<Failure, ProductsModel?>> getSingleProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await productsRemoteDataSource.getSingleProducts();
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await productsLocalDataSource.getSingleProductsCached();
        return Right(local);
      } on EmptyCacheFailure {
        return Left(OfflineFailure());
      }
    }
  }
}
