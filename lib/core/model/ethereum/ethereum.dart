import 'package:json_annotation/json_annotation.dart';

part 'ethereum.g.dart';

@JsonSerializable(nullable: false)
class Ethereum {
  Ethereum();

  @JsonKey(name: "usd")
  var usd;


  factory Ethereum.fromJson(Map<String, dynamic> json) => _$EthereumFromJson(json);
  Map<String, dynamic> toJson() => _$EthereumToJson(this);
}