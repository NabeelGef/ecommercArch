import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/order_repositories.dart';
import '../datasource/orders_home_datasource.dart';
import '../datasource/orders_remot_datasource.dart';
import '../model/orders_model.dart';

class OrdersRepositoriesImpl implements OrderRepo {
  final OrdersRemoteDataSourceImpl ordersRemoteDataSourceImpl;
  final OrdersLocalDataSourceImpl ordersLocalDataSourceImpl;
  final NetworkInfo networkInfo;

  OrdersRepositoriesImpl(
      {required this.ordersLocalDataSourceImpl,
      required this.ordersRemoteDataSourceImpl,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<OrdersModel>>> getOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final remot = await ordersRemoteDataSourceImpl.getAllOrders();
        return Right(remot);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await ordersLocalDataSourceImpl.getAllOrdersCached();
        return Right(local);
      } on EmptyCacheFailure {
        return Left(OfflineFailure());
      }
    }
  }
}
