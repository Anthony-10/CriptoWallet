import 'package:json_annotation/json_annotation.dart';

part 'major_coins.g.dart';

@JsonSerializable(nullable: false)
class MajorCoins {
  MajorCoins();

  @JsonKey(name: "bitcoin")
  Map bitcoin;

  @JsonKey(name: "ethereum")
  Map ethereum;


  factory MajorCoins.fromJson(Map<String, dynamic> json) => _$MajorCoinsFromJson(json);
  Map<String, dynamic> toJson() => _$MajorCoinsToJson(this);
}
