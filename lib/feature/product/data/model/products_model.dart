
import '../../domain/entities/product.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel(
      {required super.id,
      required super.descriptionProduct,
      required super.nameProduct,
      required super.imageProduct,
      required super.priceProduct,
      required super.quantityProduct});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json["id"],
        quantityProduct: json["quantity_product"],
        descriptionProduct: json["description_product"],
        imageProduct: json["image_product"],
        nameProduct: json["name_product"],
        priceProduct: json["price_product"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "quantity_product": quantityProduct,
      "description_product": descriptionProduct,
      "image_product": imageProduct,
      "name_product": nameProduct,
      "price_product": priceProduct,
    };
  }
}
