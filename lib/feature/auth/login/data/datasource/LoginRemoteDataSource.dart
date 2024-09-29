import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../core/strings/apis.dart';
import '../../../../../core/util/app_response.dart';
import '../model/LoginModel.dart';

abstract class LoginRemoteDataSource {
  Future<Unit> login(LoginModel loginModel);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  @override
  Future<Unit> login(LoginModel loginModel) async {
    AppResponse response = await NetworkHelper().post(ApisWords.login, body: loginModel.toJson());
    if(response.statusCode == 201){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }
}