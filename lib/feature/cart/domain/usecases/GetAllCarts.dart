import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/cart_entitites.dart';
import '../repositories/cart_repositories.dart';

class GetAllCartsUseCase{
  CartRepositories cartRepositories;

  GetAllCartsUseCase({
    required this.cartRepositories,
  });

  Future<Either<Failure,List<CartEntity>>> call(){
    return cartRepositories.getAllCarts();
  }
}