import 'dart:convert';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/storage_handler.dart';
import '../model/products_model.dart';

abstract class ProductsLocalDataSource {
  Future<List<ProductsModel>> getAllProductsCached();
  Future<Unit> cacheProducts(List<ProductsModel> products);
  Future<ProductsModel?> getSingleProductsCached();
  Future<Unit> cacheSingleProducts(ProductsModel products);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  @override
  Future<Unit> cacheProducts(List<ProductsModel> products) {
    List productsToJson = products
        .map<Map<String, dynamic>>((productssModel) => productssModel.toJson())
        .toList();
    return StorageHandler().storeProducts(productsToJson);
  }

  @override
  Future<List<ProductsModel>> getAllProductsCached() {
    String? productsCached = StorageHandler().cachedProducts;
    if (productsCached != null) {
      List decodeJsonData = json.decode(productsCached);
      List<ProductsModel> jsonToPostModels = decodeJsonData
          .map<ProductsModel>(
              (jsonPostModel) => ProductsModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw OnEmptyCacheException();
    }
  }

  @override
  Future<ProductsModel?> getSingleProductsCached() {
    String? productsCached = StorageHandler().cachedSingleProducts;
    if (productsCached != null) {
      Map<String, dynamic> decodeJsonData = json.decode(productsCached);
      ProductsModel productsModel = ProductsModel.fromJson(decodeJsonData);
      return Future.value(productsModel);
    } else {
      throw OnEmptyCacheException();
    }
  }

  @override
  Future<Unit> cacheSingleProducts(ProductsModel products) {
    Map<String, dynamic> productsToJson = products.toJson();

    return StorageHandler().storeSingleProducts(productsToJson);
  }
}
