import '../../../../core/network/network_helper.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../core/strings/apis.dart';
import '../../../../core/util/app_response.dart';
import '../model/products_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductsModel>> getAllProducts();
  Future<ProductsModel?> getSingleProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  Future<List<ProductsModel>> getAllProducts() async {
    AppResponse response = await NetworkHelper().get(ApisWords.products);
    return response.toList((json) => ProductsModel.fromJson(json));
  }

  @override
  Future<ProductsModel?> getSingleProducts() async {
    AppResponse response = await NetworkHelper().get(ApisWords.singleproducts);
    return response.toFromJson(
      (json) => ProductsModel.fromJson(json),
    );
  }
}
