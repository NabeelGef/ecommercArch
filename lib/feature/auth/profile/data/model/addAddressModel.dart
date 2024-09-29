
import '../../domain/entities/add_address_entitiy.dart';

class AddAddressModel extends AddAddressEntity{
  AddAddressModel({required super.id, required super.name, required super.city, required super.country, required super.state, required super.street1, required super.street2, required super.zipcode, required super.lat, required super.long});

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'country': country,
      'state': state,
      'street1': street1,
      'street2': street2,
      'zipcode': zipcode,
      'lat': lat,
      'long': long,
    };
  }
}