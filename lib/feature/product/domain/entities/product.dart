import 'package:equatable/equatable.dart';

abstract class ProductsEntity extends Equatable {
  int id;
  String descriptionProduct;
  String nameProduct;
  String imageProduct;
  double priceProduct;
  int quantityProduct;

  ProductsEntity(
      {required this.id,
      required this.descriptionProduct,
      required this.nameProduct,
      required this.imageProduct,
      required this.priceProduct,
      required this.quantityProduct});

  @override
  List<Object?> get props =>
      [id, nameProduct, imageProduct, priceProduct, quantityProduct];

  Map<String, dynamic> toJson();
}
