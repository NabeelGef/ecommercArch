import 'package:equatable/equatable.dart';

abstract class ProfileEntity extends Equatable{

  int id;
  String name;
  String phone;
  String email;
  String dateBirth;

  ProfileEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.dateBirth,
  });

  @override
  List<Object?> get props => [id,name,phone,email,dateBirth];

  Map<String, dynamic> toJson();


}