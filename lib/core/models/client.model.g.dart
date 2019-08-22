// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientModel _$ClientModelFromJson(Map<String, dynamic> json) {
  return ClientModel(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    address: json['address'] == null
        ? null
        : _Address.fromJson(json['address'] as Map<String, dynamic>),
    phone: json['phone'] as String,
    website: json['website'] as String,
    company: json['company'] == null
        ? null
        : _Company.fromJson(json['company'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClientModelToJson(ClientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company,
    };

_Address _$_AddressFromJson(Map<String, dynamic> json) {
  return _Address(
    street: json['street'] as String,
    suite: json['suite'] as String,
    city: json['city'] as String,
    zipcode: json['zipcode'] as String,
    geo: json['geo'] == null
        ? null
        : _Geo.fromJson(json['geo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_AddressToJson(_Address instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };

_Geo _$_GeoFromJson(Map<String, dynamic> json) {
  return _Geo(
    lat: json['lat'] as String,
    lng: json['lng'] as String,
  );
}

Map<String, dynamic> _$_GeoToJson(_Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_Company _$_CompanyFromJson(Map<String, dynamic> json) {
  return _Company(
    name: json['name'] as String,
    catchPhrase: json['catchPhrase'] as String,
    bs: json['bs'] as String,
  );
}

Map<String, dynamic> _$_CompanyToJson(_Company instance) => <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
