import 'package:equatable/equatable.dart';

abstract class CartEntity extends Equatable{
  int id;
  String productName;
  String productImage;
  double productPrice;
  int productQty;

  CartEntity({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQty,
  });

  Map<String, dynamic> toJson();

  @override
  List<Object> get props => [id,productName,productImage,productPrice,productQty];
}