import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';
import '../../domain/entities/add_address_entitiy.dart';
import '../../domain/entities/profile_entities.dart';
import '../../domain/usecases/addAddress.dart';
import '../../domain/usecases/getProfile.dart';
import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileUseCase profileUseCase;
  AddAddressUseCase addAddressUseCase;
  ProfileCubit({
    required this.profileUseCase,
    required this.addAddressUseCase
  }):super(InitialProfileState());

  fetchProfile(int id ) async{
    emit(LoadingProfileState());

    final failureOrDoneMessage = await profileUseCase(id);
    emit(_mapFailureOrPostsToStateProfile(failureOrDoneMessage));
  }
  ProfileStates _mapFailureOrPostsToStateProfile(
      Either<Failure,ProfileEntity?> either){
    return either.fold(
          (failure) => ErrorProfileState(message: _mapFailureToMessage(failure)),
          (profile) {
            return profile!=null ?
            GetProfileState(profile)
                :ErrorProfileState(message: FailureMessages.empty);
          },
    );
  }

  addAddress(AddAddressEntity addAddressEntity) async{
    emit(LoadingAddAddressState());

    final failureOrDoneMessage = await addAddressUseCase(addAddressEntity);
    emit(_mapFailureOrPostsToStateAddAddress(failureOrDoneMessage));
  }
  ProfileStates _mapFailureOrPostsToStateAddAddress(
      Either<Failure,Unit> either){
    return either.fold(
          (failure) => ErrorAddAddressState(message: _mapFailureToMessage(failure)),
          (_) => AddAddressSuccessState(successMessage: AppMessages.addAddressSuccess),
    );
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return FailureMessages.error;
      case const (EmptyCacheFailure):
        return FailureMessages.noData;
      case const (OfflineFailure):
        return FailureMessages.noInternet;
      default:
        return FailureMessages.unexpected;
    }
  }
}