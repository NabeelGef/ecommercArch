import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/storage_handler.dart';
import '../model/orders_model.dart';

abstract class OrdersLocalDataSource {
  Future<List<OrdersModel>> getAllOrdersCached();
  Future<Unit> cacheOrders(List<OrdersModel> orders);
}

class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  @override
  Future<Unit> cacheOrders(List<OrdersModel> orders) {
    List ordersToJson = orders
        .map<Map<String, dynamic>>((ordersModel) => ordersModel.toJson())
        .toList();
    return StorageHandler().storeOrders(ordersToJson);
  }

  @override
  Future<List<OrdersModel>> getAllOrdersCached() {
    String? ordersCached = StorageHandler().cachedOrders;
    if (ordersCached != null) {
      List decodeJsonData = json.decode(ordersCached);
      List<OrdersModel> jsonToPostModels = decodeJsonData
          .map<OrdersModel>(
              (jsonPostModel) => OrdersModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw OnEmptyCacheException();
    }
  }
}
