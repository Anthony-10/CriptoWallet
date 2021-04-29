// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coins _$CoinsFromJson(Map<String, dynamic> json) {
  return Coins()
    ..name = json['name'] as String
    ..currentPrice = json['current_price'] as int
    ..coins = (json['coins'] as List)
        .map((e) => Coins.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$CoinsToJson(Coins instance) => <String, dynamic>{
      'name': instance.name,
      'current_price': instance.currentPrice,
      'coins': instance.coins,
    };
