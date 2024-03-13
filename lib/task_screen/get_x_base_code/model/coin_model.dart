import 'package:demo/task_screen/get_x_base_code/model/coin_value_model.dart';

class CoinModel {
  final int? noOfPlayer;
  final int? noOfCoins;
  final List<CoinValueModel>? coinValue;

  CoinModel({
    this.noOfPlayer,
    this.noOfCoins,
    this.coinValue,
  });

  @override
  String toString() {
    return 'CoinModel{noOfPlayer: $noOfPlayer, noOfCoins: $noOfCoins, coinValue: $coinValue}';
  }
}