import 'package:new_crypto_wallet/core/model/coins.dart';

abstract class CoinRepo{
  Future <List<Coins>>getCoin();
  Future <List<Coins>>getSearchCoin(String query);
}