import 'package:json_annotation/json_annotation.dart';

part 'bitcoinCash.g.dart';

@JsonSerializable(nullable: false)
class BitcoinCash {
  BitcoinCash();

  @JsonKey(name: "usd")
  var usd;

  factory BitcoinCash.fromJson(Map<String, dynamic> json) =>
      _$BitcoinCashFromJson(json);
  Map<String, dynamic> toJson() => _$BitcoinCashToJson(this);
}
