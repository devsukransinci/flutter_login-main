// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      address: json['address'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      zipcode: json['zipcode'] as String,
      state: json['state'] as String?,
      company: json['company'] as String?,
    )..address_id = json['address_id'] as int;

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'address_id': instance.address_id,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'zipcode': instance.zipcode,
      'company': instance.company,
      'state': instance.state,
    };
