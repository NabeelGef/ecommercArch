
import '../../domain/entities/signup_entities.dart';

class SignupModel extends SignupEntity {
  SignupModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    required super.phone,
    required super.dateBirth,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "datebirth": dateBirth,
    };
  }
  // we don't want any fromJson
}
