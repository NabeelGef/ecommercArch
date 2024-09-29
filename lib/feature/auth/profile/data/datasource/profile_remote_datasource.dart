import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../core/strings/apis.dart';
import '../../../../../core/util/app_response.dart';
import '../model/addAddressModel.dart';
import '../model/profile_model.dart';

abstract class ProfileRemoteDataSource{
  Future<ProfileModel?> getProfile(int id);
  Future<Unit> AddAddress(AddAddressModel addAddressModel);

}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{

  @override
  Future<ProfileModel?> getProfile(int id) async {
   AppResponse appResponse = await NetworkHelper().get(ApisWords.profile ,
   queryParameters: {"id":id}
   );
   return appResponse.toFromJson((json) => ProfileModel.fromJson(json));
  }

  @override
  Future<Unit> AddAddress(AddAddressModel addAddressModel) async {
  AppResponse appResponse = await NetworkHelper().post(ApisWords.addAddress ,
  body: addAddressModel.toJson());
  if(appResponse.statusCode == 201){
    return Future.value(unit);
  }else{
    throw ServerException();
  }

  }

}