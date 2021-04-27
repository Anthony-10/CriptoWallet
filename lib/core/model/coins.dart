import 'package:json_annotation/json_annotation.dart';

//part 'coins.g.dart';

@JsonSerializable()
class Coins {

  Coins();

  @JsonKey(name : "id")
  String id;

  @JsonKey(name : "current_price")
  String currentPrice;
//TODO
  //factory Coins.fromJson(Map<String, dynamic> json) => _$CoinsFromJson(json);
  //Map<String, dynamic> toJson() => _$CoinsToJson(this);
}

