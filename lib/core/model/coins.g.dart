// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coins _$CoinsFromJson(Map<String, dynamic> json) {
  return Coins()
    ..id = json['id'] as String
    ..currentPrice = json['current_price'] as String;
}

Map<String, dynamic> _$CoinsToJson(Coins instance) => <String, dynamic>{
      'id': instance.id,
      'current_price': instance.currentPrice,
    };
