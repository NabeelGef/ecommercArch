import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';
import '../../data/model/signup_model.dart';
import '../../domain/usecases/signup_usecases.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController dateBirth = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  signup(int id) async {
    emit(LoadingSignupState());

    if (formState.currentState!.validate()) {
      SignupModel signupModel = SignupModel(
          id: id,
          email: email.text,
          name: name.text,
          dateBirth: dateBirth.text,
          phone: phone.text,
          password: password.text);
      final failureOrDoneMessage = await signupUseCase(signupModel);
      emit(_mapFailureOrPostsToStateSignup(
          failureOrDoneMessage, AppMessages.signupSuccess));
    }
  }

  SignupState _mapFailureOrPostsToStateSignup(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorSignupState(message: _mapFailureToMessage(failure)),
      (_) => MessageSuccessSignupState(messageSuccess: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return FailureMessages.error;
      case const (OfflineFailure):
        return FailureMessages.noInternet;
      default:
        return FailureMessages.unexpected;
    }
  }
}
