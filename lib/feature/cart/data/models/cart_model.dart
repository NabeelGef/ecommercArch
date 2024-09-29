
import '../../domain/entities/cart_entitites.dart';

class CartModel extends CartEntity{
  CartModel({required super.id, required super.productName, required super.productImage, required super.productPrice, required super.productQty});

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'productQty': productQty,
    };
  }
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      productName: json['productName'],
      productImage: json['productImage'],
      productPrice: json['productPrice'],
      productQty: json['productQty'],
    );
  }
}