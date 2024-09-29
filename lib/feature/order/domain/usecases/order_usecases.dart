import 'package:dartz/dartz.dart';


import '../../../../../core/error/failure.dart';
import '../entities/order_entities.dart';
import '../repositories/order_repositories.dart';

class OrderUseCase {
  OrderRepo orderRepo;

  OrderUseCase(this.orderRepo);

  Future<Either<Failure, List<OrderEntity>>> call() {
    return orderRepo.getOrders();
  }
}
