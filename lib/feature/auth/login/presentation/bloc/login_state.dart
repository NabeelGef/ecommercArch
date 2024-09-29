import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  @override
  List<Object> get props =>[];
}

class InitialLoginState extends LoginState{}

class LoadingLoginState extends LoginState{}

class ErrorLoginState extends LoginState{
  String message;

  ErrorLoginState({required this.message});

  @override
  List<Object> get props =>[message];
}

class MessageSuccessLoginState extends LoginState{
  String messageSuccess;

  MessageSuccessLoginState({required this.messageSuccess});

  @override
  List<Object> get props =>[messageSuccess];
}


