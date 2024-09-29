
import '../../domain/entities/add_to_cart_entitity.dart';

class AddToCartModel extends AddToCartEntity{
  AddToCartModel({required super.productId, required super.quantity});

  @override
  List<Object> get props => [productId,quantity];

  @override
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}