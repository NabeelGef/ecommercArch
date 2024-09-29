
import '../../domain/entities/profile_entities.dart';

class ProfileModel extends ProfileEntity{
  ProfileModel({required super.id, required super.name, required super.phone, required super.email, required super.dateBirth});

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'dateBirth': dateBirth,
    };
  }
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      dateBirth: json['dateBirth'],
    );
  }

}