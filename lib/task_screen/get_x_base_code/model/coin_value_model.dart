class CoinValueModel {
  final int player;
  final List<int> coins;
  final int totalCoins;

  CoinValueModel({required this.player, required this.coins, required this.totalCoins});

  @override
  String toString() {
    return 'CoinValue{player: $player, coins: $coins, totalCoins: $totalCoins}';
  }
}