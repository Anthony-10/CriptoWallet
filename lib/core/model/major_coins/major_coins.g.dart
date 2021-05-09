// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'major_coins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MajorCoins _$MajorCoinsFromJson(Map<String, dynamic> json) {
  return MajorCoins()
    ..bitcoin = json['bitcoin'] as Map<String, dynamic>
    ..ethereum = json['ethereum'] as Map<String, dynamic>;
}

Map<String, dynamic> _$MajorCoinsToJson(MajorCoins instance) =>
    <String, dynamic>{
      'bitcoin': instance.bitcoin,
      'ethereum': instance.ethereum,
    };
