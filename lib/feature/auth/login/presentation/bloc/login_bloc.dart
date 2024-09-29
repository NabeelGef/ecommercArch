import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';
import '../../data/model/LoginModel.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginUseCase loginUseCase;

  LoginCubit({
    required this.loginUseCase,
  }):super(InitialLoginState());

  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {

    emit(LoadingLoginState());

    if(formState.currentState!.validate()){
      LoginModel loginModel = LoginModel(phone: phone.text , password: password.text);
      final failureOrDoneMessage = await loginUseCase(loginModel);
      emit(_mapFailureOrPostsToStateLogin(failureOrDoneMessage,AppMessages.loginSuccess));

    }
  }
  LoginState _mapFailureOrPostsToStateLogin(
      Either<Failure, Unit> either,String message) {
    return either.fold(
          (failure) => ErrorLoginState(message: _mapFailureToMessage(failure)),
          (_) => MessageSuccessLoginState(messageSuccess: message),
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