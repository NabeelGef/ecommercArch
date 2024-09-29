import 'package:equatable/equatable.dart';

abstract class AddToCartEntity extends Equatable{
  int productId;
  int quantity;
  AddToCartEntity({
    required this.productId,
    required this.quantity,
  });

  @override

  List<Object?> get props => [productId , quantity];

  Map<String, dynamic> toJson();

}