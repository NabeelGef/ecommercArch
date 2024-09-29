import 'package:equatable/equatable.dart';

abstract class SignupEntity extends Equatable {
  int id;
  String name;
  String phone;
  String password;
  String email;
  String dateBirth;

  SignupEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.dateBirth,
  });

  @override
  List<Object?> get props => [id, name, phone, email, dateBirth, password];

  Map<String, dynamic> toJson();
}
