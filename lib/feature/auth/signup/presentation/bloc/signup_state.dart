import 'package:equatable/equatable.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

class LoadingSignupState extends SignupState {}

class ErrorSignupState extends SignupState {
  String message;

  ErrorSignupState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageSuccessSignupState extends SignupState {
  String messageSuccess;

  MessageSuccessSignupState({required this.messageSuccess});

  @override
  List<Object> get props => [messageSuccess];
}
