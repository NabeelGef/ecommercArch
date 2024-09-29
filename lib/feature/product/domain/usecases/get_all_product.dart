import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repositories.dart';

class GetAllProducts {
  final ProductsRepo productRepo;

  GetAllProducts(this.productRepo);

  Future<Either<Failure, List<ProductsEntity>>> call() {
    return productRepo.getAllProducts();
  }
}
