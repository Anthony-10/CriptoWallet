import 'package:json_annotation/json_annotation.dart';

part 'bitcoin.g.dart';

@JsonSerializable(nullable: false)
class Bitcoin {
  Bitcoin();

  @JsonKey(name: "usd")
  var usd;

  factory Bitcoin.fromJson(Map<String, dynamic> json) =>
      _$BitcoinFromJson(json);
  Map<String, dynamic> toJson() => _$BitcoinToJson(this);
}
