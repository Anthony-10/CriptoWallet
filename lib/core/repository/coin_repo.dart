import 'package:new_crypto_wallet/core/model/all_coins/coins.dart';
import 'package:new_crypto_wallet/core/model/major_coins/major_coins.dart';

abstract class CoinRepo{
  Future <List<Coins>>getCoin();
  Future <List<Coins>>getSearchCoin(String query);
  Future <Map<String, dynamic>>  getMajorCoin();
}