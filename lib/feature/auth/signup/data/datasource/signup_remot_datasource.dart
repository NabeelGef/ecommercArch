import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../core/strings/apis.dart';
import '../../../../../core/util/app_response.dart';
import '../model/signup_model.dart';

abstract class SignupRemoteDataSource {
  Future<Unit> signup(SignupModel signupModel);
}

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  @override
  Future<Unit> signup(SignupModel signupModel) async {
    AppResponse response = await NetworkHelper()
        .post(ApisWords.signup, body: signupModel.toJson());
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
