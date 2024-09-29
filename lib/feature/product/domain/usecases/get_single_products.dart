import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repositories.dart';

class GetSingleProducts {
  final ProductsRepo productRepo;

  GetSingleProducts(this.productRepo);

  Future<Either<Failure, ProductsEntity?>> call() {
    return productRepo.getSingleProducts();
  }
}
