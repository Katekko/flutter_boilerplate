import 'package:json_annotation/json_annotation.dart';

part 'client.model.g.dart';

@JsonSerializable()
class ClientModel {
  int id;
  String name;
  String username;
  String email;
  _Address address;
  String phone;
  String website;
  _Company company;

  ClientModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);
}

@JsonSerializable()
class _Address {
  String street;
  String suite;
  String city;
  String zipcode;
  _Geo geo;

  _Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory _Address.fromJson(Map<String, dynamic> json) =>
      _$_AddressFromJson(json);

  Map<String, dynamic> toJson() => _$_AddressToJson(this);
}

@JsonSerializable()
class _Geo {
  String lat;
  String lng;

  _Geo({this.lat, this.lng});

  factory _Geo.fromJson(Map<String, dynamic> json) => _$_GeoFromJson(json);

  Map<String, dynamic> toJson() => _$_GeoToJson(this);
}

@JsonSerializable()
class _Company {
  String name;
  String catchPhrase;
  String bs;

  _Company({this.name, this.catchPhrase, this.bs});

  factory _Company.fromJson(Map<String, dynamic> json) =>
      _$_CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$_CompanyToJson(this);
}
