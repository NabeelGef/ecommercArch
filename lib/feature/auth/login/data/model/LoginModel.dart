
import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity{
  LoginModel({required super.phone, required super.password});

  @override
  Map<String, dynamic> toJson() {
   return {
     "phone":phone,
     "password":password
   };
  }
  // we don't want any fromJson
}