import 'dart:math';

import 'package:flutter/material.dart';

class CoinGameScreen extends StatefulWidget {
  const CoinGameScreen({super.key});

  @override
  _CoinGameScreenState createState() => _CoinGameScreenState();
}

class _CoinGameScreenState extends State<CoinGameScreen> {
  final TextEditingController _numPlayersController = TextEditingController();
  final TextEditingController _numCoinsController = TextEditingController();
  CoinGame? _coinGame;

  int numberOfPlayers = 0;
  int numberOfCoins = 0;
  int maxPlayer = 0;
  int maxCoinPlayer = 0;
  int largestCoinValue = 0;

  List<int> coins = [];
  Map<int, List<int>> playerCoinsMap = {};

  int getPlayerWithHighestCoins() {
    int maxPlayer = 0;
    int largestCoins = 0;

    for (var element in coins) {
      if (element > largestCoins) {
        largestCoins = element;
      }
    }

    playerCoinsMap.forEach((player, playerCoins) {
      if(playerCoins.contains(largestCoins)){
        maxPlayer = player;
      }
    });

    return maxPlayer;
  }

  (int, int) getPlayerWithLowestCoins() {
    int maxPlayer = 0;
    int lowestCoins = 0;

    coins.forEach((element) {
      if (element > lowestCoins) {
        lowestCoins = element;
      }
    });

    playerCoinsMap.forEach((player, playerCoins) {
      if(playerCoins.contains(lowestCoins)){
        maxPlayer = player;
      }
    });

    return (maxPlayer,lowestCoins);
  }


  int getPlayerWithMaxCoins() {
    int maxPlayer = 0;
    int maxCoins = 0;

    playerCoinsMap.forEach((player, playerCoins) {
      if (playerCoins.length > maxCoins) {
        maxPlayer = player;
        maxCoins = playerCoins.length;
      }
    });

    return maxPlayer;
  }


  // Function to find the player with the maximum coin value
  int findPlayerWithMaxCoinValue(Map<int, List<int>> playerCoinsMap) {
    int maxPlayer = 0;
    int maxCoinValue = 0;

    playerCoinsMap.forEach((player, playerCoins) {
      int coinValueSum = playerCoins.reduce((sum, coin) => sum + coin);
      if (coinValueSum > maxCoinValue) {
        maxPlayer = player;
        maxCoinValue = coinValueSum;
      }
    });

    return maxPlayer;
  }

  void _playGame() {
    try {
      numberOfPlayers = int.parse(_numPlayersController.text);
      numberOfCoins = int.parse(_numCoinsController.text);

      // Generate random values for coins between 1 to 100
      Random random = Random();
      coins = List.generate(numberOfCoins, (index) => random.nextInt(100) + 1);

      // Divide coins among players in sequence
      playerCoinsMap = {};
      for (int i = 0; i < numberOfPlayers; i++) {
        playerCoinsMap[i + 1] = [];
      }

      for (int i = 0; i < numberOfCoins; i++) {
        int playerIndex = i % numberOfPlayers + 1;
        playerCoinsMap[playerIndex]?.add(coins[i]);
      }

      setState(() {
        _coinGame = CoinGame(numberOfPlayers, playerCoinsMap);
      });
      // Find and print the player with the maximum number of coins
      maxPlayer = getPlayerWithMaxCoins();

      // Find and print the player with the maximum coin value
      maxCoinPlayer = findPlayerWithMaxCoinValue(playerCoinsMap);

      // Find and print the largest coin value from all distributed player coins
      largestCoinValue = getPlayerWithHighestCoins();

    } catch (e) {
      // Handle invalid input
      print("Invalid input: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text('Coin Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _numPlayersController,
              decoration: InputDecoration(labelText: 'Enter Number of Players'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _numCoinsController,
              decoration: InputDecoration(labelText: 'Enter Number of Coins'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playGame,
              child: Text('Play'),
            ),
            SizedBox(height: 20),
            if (_coinGame != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Number of Players: $numberOfPlayers'),
                      Text('Number of Coins: $numberOfCoins'),
                      Text('Coins values: $coins'),
                      Text('Distribute coins to players in sequence: \n${_coinGame!.playerCoins}'),
                      Text('Player $maxPlayer has the maximum number of coins'),
                      Text('Player $maxCoinPlayer has the maximum coin value'),
                      Text('Player $largestCoinValue has the largest coin value'),
                      const Text('All players with coins and total value:'),
                      for (var entry in _coinGame!.playerCoins.entries) Text('Player ${entry.key} : No of coins ${entry.value.length} : Total Value ${entry.value.fold(0, (sum, coin) => sum + coin)}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CoinGame {
  final int numPlayers;
  final Map<int, List<int>> playerCoins;

  CoinGame(this.numPlayers, this.playerCoins);
}
