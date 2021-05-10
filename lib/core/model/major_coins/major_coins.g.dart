// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'major_coins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MajorCoins _$MajorCoinsFromJson(Map<String, dynamic> json) {
  return MajorCoins()
    ..bitcoin = json['bitcoin'] as Map<String, dynamic>
    ..ethereum = json['ethereum'] as Map<String, dynamic>
    ..tether = json['tether'] as Map<String, dynamic>
    ..liteCoin = json['litecoin'] as Map<String, dynamic>
    ..bitcoinCash = json['bitcoin-cash'] as Map<String, dynamic>;
}

Map<String, dynamic> _$MajorCoinsToJson(MajorCoins instance) =>
    <String, dynamic>{
      'bitcoin': instance.bitcoin,
      'ethereum': instance.ethereum,
      'tether': instance.tether,
      'litecoin': instance.liteCoin,
      'bitcoin-cash': instance.bitcoinCash,
    };
