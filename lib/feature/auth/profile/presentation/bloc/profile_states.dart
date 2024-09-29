import 'package:equatable/equatable.dart';

import '../../domain/entities/profile_entities.dart';

abstract class ProfileStates extends Equatable{
  const ProfileStates();
  @override
  List<Object> get props => [];
}

class LoadingAddAddressState extends ProfileStates{}
class ErrorAddAddressState extends ProfileStates{
  String message;

  ErrorAddAddressState({
    required this.message,
  });
  @override
  List<Object> get props =>[message];
}
class AddAddressSuccessState extends ProfileStates{
  String successMessage;

  AddAddressSuccessState({
    required this.successMessage,
  });
  @override
  List<Object> get props =>[successMessage];
}

class InitialProfileState extends ProfileStates{}
class LoadingProfileState extends ProfileStates{}
class ErrorProfileState extends ProfileStates{
  String message;

  ErrorProfileState({
    required this.message,
  });
  @override
  List<Object> get props =>[message];
}

class GetProfileState extends ProfileStates{
  ProfileEntity profileEntity;

  GetProfileState(this.profileEntity);

  @override
  List<Object> get props => [profileEntity];
}

