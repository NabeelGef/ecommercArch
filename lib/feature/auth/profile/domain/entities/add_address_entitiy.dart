import 'package:equatable/equatable.dart';

abstract class AddAddressEntity extends Equatable  {
  int id;
  String name;
  String city;
  String country;
  String state;
  String street1;
  String street2;
  String zipcode;
  double lat;
  double long;

  AddAddressEntity({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.state,
    required this.street1,
    required this.street2,
    required this.zipcode,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toJson();
  @override
  List<Object?> get props => [id,name,city,country,state,street1,street2,zipcode,lat,long];
}