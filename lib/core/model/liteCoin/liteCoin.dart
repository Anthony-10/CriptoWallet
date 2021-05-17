import 'package:json_annotation/json_annotation.dart';

part 'liteCoin.g.dart';

@JsonSerializable(nullable: false)
class LiteCoin {
  LiteCoin();

  @JsonKey(name: "usd")
  var usd;

  factory LiteCoin.fromJson(Map<String, dynamic> json) =>
      _$LiteCoinFromJson(json);
  Map<String, dynamic> toJson() => _$LiteCoinToJson(this);
}
