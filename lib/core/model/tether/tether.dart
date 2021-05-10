import 'package:json_annotation/json_annotation.dart';

part 'tether.g.dart';

@JsonSerializable(nullable: false)
class Tether {
  Tether();

  @JsonKey(name: "usd")
  var usd;


  factory Tether.fromJson(Map<String, dynamic> json) => _$TetherFromJson(json);
  Map<String, dynamic> toJson() => _$TetherToJson(this);
}