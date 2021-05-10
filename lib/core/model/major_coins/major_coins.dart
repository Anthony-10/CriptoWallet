import 'package:json_annotation/json_annotation.dart';

part 'major_coins.g.dart';

@JsonSerializable(nullable: false)
class MajorCoins {
  MajorCoins();

  @JsonKey(name: "bitcoin")
  Map bitcoin;

  @JsonKey(name: "ethereum")
  Map ethereum;

  @JsonKey(name: "tether")
  Map tether;

  @JsonKey(name: "litecoin")
  Map liteCoin;

  @JsonKey(name: "bitcoin-cash")
  Map bitcoinCash;


  factory MajorCoins.fromJson(Map<String, dynamic> json) => _$MajorCoinsFromJson(json);
  Map<String, dynamic> toJson() => _$MajorCoinsToJson(this);
}
