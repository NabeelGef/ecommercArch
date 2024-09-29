import 'package:equatable/equatable.dart';

import '../../domain/entities/order_entities.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}

final class GetOrdersState extends OrdersState {
  List<OrderEntity> orderEntity;
  GetOrdersState(this.orderEntity);
  @override
  List<Object> get props => [orderEntity];
}

final class LoadingOrdersState extends OrdersState {}

final class ErrorOrdersState extends OrdersState {
  String message;

  ErrorOrdersState({required this.message});

  @override
  List<Object> get props => [message];
}
