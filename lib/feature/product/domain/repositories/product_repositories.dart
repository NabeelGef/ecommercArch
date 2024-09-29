import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductsEntity>>> getAllProducts();
  Future<Either<Failure, ProductsEntity?>> getSingleProducts();
}
