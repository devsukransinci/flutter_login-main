import 'package:json_annotation/json_annotation.dart';

part 'user_address.g.dart';

@JsonSerializable()
class UserAddress {
  int address_id = -1;
  String address = "";
  String city = "";
  String country = "";
  String zipcode = "";
  String? company = "";
  String? state = "";

  UserAddress(
      {required this.address,
      required this.city,
      required this.country,
      required this.zipcode,
      this.state,
      this.company});

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'address': address,
      'city': city,
      'country': country,
      'zipcode': zipcode,
      'company': company,
      'state': state,
    };
  }

  String toString() {
    return '$address, $city, $country, $zipcode';
  }

  @override
  bool operator ==(Object other) {
    if (other is UserAddress) {
      return address_id == other.address_id;
    }
    return false;
  }

  @override
  int get hashCode => address_id.hashCode;
}
