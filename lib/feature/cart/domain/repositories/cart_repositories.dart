import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/add_to_cart_entitity.dart';
import '../entities/cart_entitites.dart';

abstract class CartRepositories{
  Future<Either<Failure,List<CartEntity>>> getAllCarts();
  Future<Either<Failure,Unit>> addToCarts(AddToCartEntity cartEntity);
}