import 'package:equatable/equatable.dart';

import '../../domain/entities/cart_entitites.dart';


abstract class CartState extends Equatable{
  const CartState();
  @override
  List<Object> get props =>[];
}
// GetAllCarts =======================>
class InitialCartState extends CartState{}
class LoadingCartState extends CartState{}
class ErrorCartState extends CartState{
  String message;

  ErrorCartState({
    required this.message,
  });

  @override
  List<Object> get props =>[message];
}
class GetCartState extends CartState{
  List<CartEntity> carts;

  GetCartState(this.carts);
  @override
  List<Object> get props =>[carts];
}
//AddToCart=======================>
class LoadingAddToCartState extends CartState{}
class ErrorAddToCartState extends CartState{
  String message;
  @override

  ErrorAddToCartState({
    required this.message,
  });
  List<Object> get props => [message];
}
class AddToCartSuccessState extends CartState{
  String successMessage;
  @override

  AddToCartSuccessState({
    required this.successMessage,
  });
  List<Object> get props => [successMessage];
}
