
import '../../../../core/network/network_helper.dart';

import 'package:dio/dio.dart' as dio;

import '../../../../core/strings/apis.dart';
import '../../../../core/util/app_response.dart';
import '../model/orders_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrdersModel>> getAllOrders();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  @override
  Future<List<OrdersModel>> getAllOrders() async {
    AppResponse response = await NetworkHelper().get(ApisWords.order);
    return response.toList((json) => OrdersModel.fromJson(json));
  }
}
