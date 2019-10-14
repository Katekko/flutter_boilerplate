import 'package:json_annotation/json_annotation.dart';

part 'client.model.g.dart';

@JsonSerializable()
class ClientModel {
  int id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  ClientModel({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);
}