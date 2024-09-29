import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_helper.dart';
import '../../../../core/strings/apis.dart';
import '../../../../core/util/app_response.dart';
import '../../domain/entities/add_to_cart_entitity.dart';
import '../models/cart_model.dart';

abstract class CartRemoteDataSource{
 Future<List<CartModel>> getAllCarts();
 Future<Unit> addToCarts(AddToCartEntity addToCartEntity);
}
class CartRemoteDataSourceImpl implements CartRemoteDataSource{

  @override
  Future<List<CartModel>> getAllCarts() async{
  AppResponse appResponse = await NetworkHelper().get(ApisWords.cart);
  return appResponse.toList(CartModel.fromJson);
  }

  @override
  Future<Unit> addToCarts(AddToCartEntity addToCartEntity) async {
    AppResponse appResponse = await NetworkHelper().post(ApisWords.addToCart,
        body:addToCartEntity.toJson());
    if(appResponse.statusCode == 201){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }
}