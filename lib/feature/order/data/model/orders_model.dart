
import '../../domain/entities/order_entities.dart';

class OrdersModel extends OrderEntity {
  OrdersModel({
    required super.id,
    required super.name,
    required super.date,
    required super.quantity,
    required super.status,
    required super.totalPrice,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      id: json["id"],
      date: json["date"],
      name: json["name"],
      quantity: json["quantity"],
      status: json["status"],
      totalPrice: json["total_Price"],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date,
      "name": name,
      "quantity": quantity,
      "status": status,
      "total_Price": totalPrice,
    };
  }
}
