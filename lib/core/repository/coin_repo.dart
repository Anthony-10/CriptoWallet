import 'package:new_crypto_wallet/core/model/all_coins/coins.dart';

abstract class CoinRepo{
  Future <List<Coins>>getCoin();
  Future <Map<String, dynamic>>getSearchCoin(String query);
  Future <Map<String, dynamic>>  getMajorCoin();
}