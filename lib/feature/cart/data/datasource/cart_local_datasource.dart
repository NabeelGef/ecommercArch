import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/storage_handler.dart';
import '../models/cart_model.dart';

abstract class CartLocalDataSource{
  Future<List<CartModel>> getAllCartsLocal();
  Future<Unit> cachedCarts(List<CartModel> cartsModel);
}

class CartLocalDataSourceImpl implements CartLocalDataSource{
  @override
  Future<Unit> cachedCarts(List<CartModel> cartsModel) {
    List cartsToJson = cartsModel
        .map<Map<String, dynamic>>(
            (carts) => carts.toJson())
        .toList();
    return StorageHandler().storeCarts(cartsToJson);
    }

  @override
  Future<List<CartModel>> getAllCartsLocal() {
    String? cartsCached = StorageHandler().cachedCarts;
    if (cartsCached != null) {
      List decodeJsonData = json.decode(cartsCached);
      List<CartModel> jsonToPostModels = decodeJsonData
          .map<CartModel>(
              (jsonPostModel) => CartModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw OnEmptyCacheException();
    }
  }

}