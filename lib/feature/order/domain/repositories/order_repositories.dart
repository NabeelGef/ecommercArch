import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/order_entities.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
}
