import 'package:equatable/equatable.dart';

abstract class OrderEntity extends Equatable {
  int id;
  String name;
  String date;
  double totalPrice;
  int quantity;
  String status;

  OrderEntity({
    required this.id,
    required this.date,
    required this.name,
    required this.quantity,
    required this.status,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [id, date, name, quantity, status, totalPrice];

  Map<String, dynamic> toJson();
}
