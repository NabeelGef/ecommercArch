import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/add_to_cart_entitity.dart';
import '../repositories/cart_repositories.dart';

class AddToCartUseCase{
  CartRepositories cartRepositories;

  AddToCartUseCase(this.cartRepositories);

  Future<Either<Failure,Unit>> call(AddToCartEntity addToCartEntity){
    return cartRepositories.addToCarts(addToCartEntity);
  }
}