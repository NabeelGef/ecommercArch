import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/storage/storage_handler.dart';
import '../model/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileModel> getProfileLocal();
  Future<Unit> cachedProfile(ProfileModel profileModel);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource{
  @override
  Future<Unit> cachedProfile(ProfileModel profileModel) {
    return StorageHandler().storeProfile(profileModel.toJson());
  }

  @override
  Future<ProfileModel> getProfileLocal() {
    String? profileCached = StorageHandler().cachedProfile;
    if(profileCached!=null){
      Map<String, dynamic> profileModelDecode = json.decode(profileCached);
      ProfileModel profileModel = ProfileModel.fromJson(profileModelDecode);
      return Future.value(profileModel);
    }else{
      throw OnEmptyCacheException();
    }
  }

}