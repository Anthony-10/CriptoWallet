import 'package:json_annotation/json_annotation.dart';

part 'coins.g.dart';

@JsonSerializable(nullable : false)
class Coins {

  Coins();

  @JsonKey(name : "id")
  String id;

  @JsonKey(name : "current_price")
  String currentPrice;


  List<Coins> coins;

  factory Coins.fromJson(Map<String, dynamic> json) => _$CoinsFromJson(json);
  Map<String, dynamic> toJson() => _$CoinsToJson(this);
}

