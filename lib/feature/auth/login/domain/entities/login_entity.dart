import 'package:equatable/equatable.dart';

abstract class LoginEntity extends Equatable{
  String phone;
  String password;

  LoginEntity({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [phone,password];

  Map<String, dynamic> toJson();
}