// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coins _$CoinsFromJson(Map<String, dynamic> json) {
  return Coins()
    ..name = json['name'] as String
    ..currentPrice = (json['current_price'] as num).toDouble()
    ..image = json['image'] as String;
}

Map<String, dynamic> _$CoinsToJson(Coins instance) => <String, dynamic>{
      'name': instance.name,
      'current_price': instance.currentPrice,
      'image': instance.image,
    };
