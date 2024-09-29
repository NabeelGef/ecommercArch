import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/strings/failures.dart';
import '../../domain/entities/order_entities.dart';
import '../../domain/usecases/order_usecases.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit({required this.orderUseCase}) : super(OrdersInitial());
  OrderUseCase orderUseCase;
  Future<void> fetchOrders() async {
    emit(LoadingOrdersState());
    final failureOrDonrMessage = await orderUseCase();
    emit(_mapFailureOrPostsToStateOrders(failureOrDonrMessage));
  }

  OrdersState _mapFailureOrPostsToStateOrders(
      Either<Failure, List<OrderEntity>> either) {
    return either.fold(
      (failure) => ErrorOrdersState(message: _mapFailureToMessage(failure)),
      (orders) => GetOrdersState(orders),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return FailureMessages.error;
      case const (EmptyCacheFailure):
        return FailureMessages.noData;
      case const (OfflineFailure):
        return FailureMessages.noInternet;
      default:
        return FailureMessages.unexpected;
    }
  }
}
