import 'dart:math';

import 'package:demo/task_screen/get_x_base_code/model/coin_model.dart';
import 'package:demo/task_screen/get_x_base_code/model/coin_value_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogicalController extends GetxController {
  TextEditingController playerController = TextEditingController();
  TextEditingController coinController = TextEditingController();

  Rxn<CoinModel> coinGame = Rxn<CoinModel>();
  RxList<int> coins = RxList([]);
  List<CoinValueModel> coinsData = [];
  Map<int, List<int>> mapPlayerCoins = {};
  RxInt maxNoOfCoinValue = RxInt(0);
  RxInt maxNoOfTotalCoin = RxInt(0);
  RxInt largestCoinValue = RxInt(0);

  //On click User Enter number of player and coins
  playGame() {
    if (playerController.text.isNotEmpty && coinController.text.isNotEmpty) {
      coinGame.value = CoinModel(
        noOfPlayer: int.parse(playerController.text),
        noOfCoins: int.parse(coinController.text),
        coinValue: [],
      );
      coinGenerator();
    }
  }

  // Generate random values for coins between 1 to 100
  coinGenerator() {
    coins.value = List.generate(coinGame.value!.noOfCoins!, (index) => Random().nextInt(100) + 1);
    coinDistributor();
  }

  // Divide coins among players in sequence
  coinDistributor() {
    mapPlayerCoins = {};

    for (int i = 0; i < coinGame.value!.noOfPlayer!; i++) {
      mapPlayerCoins[i + 1] = [];
    }

    for (int i = 0; i < coinGame.value!.noOfCoins!; i++) {
      int index = i % coinGame.value!.noOfPlayer! + 1;
      mapPlayerCoins[index]?.add(coins[i]);
    }
    addCoinDataValue();
  }

  // separating coin value and distribute that coins to the player
  addCoinDataValue() {
    coinsData = [];
    mapPlayerCoins.forEach((key, value) {
      coinsData.add(
        CoinValueModel(
          player: key,
          coins: value,
          totalCoins: value.reduce((value, element) => value + element),
        ),
      );
    });
    addAllCoinValue();
  }

  //adding coin data to the coin game model
  addAllCoinValue() {
    coinGame.value = CoinModel(
      noOfPlayer: int.parse(playerController.text),
      noOfCoins: int.parse(coinController.text),
      coinValue: coinsData,
    );
    findNoOfCoinValue();
    findNoOfTotalCoinValue();
    findPlayerWithHighestCoins();
  }

  // Find the player with the maximum number of coins
  findNoOfCoinValue() {
    int maxPlayer = 0;
    int maxCoins = 0;
    mapPlayerCoins.forEach((player, playerCoins) {
      if (playerCoins.length > maxCoins) {
        maxPlayer = player;
        maxCoins = playerCoins.length;
      }
    });
    maxNoOfCoinValue.value = maxPlayer;
  }

  // Find the player with the maximum coin value
  findNoOfTotalCoinValue() {
    int maxPlayer = 0;
    int maxCoins = 0;
    coinGame.value?.coinValue?.forEach((element) {
      if (element.totalCoins > maxCoins) {
        maxPlayer = element.player;
        maxCoins = element.totalCoins;
      }
    });
    maxNoOfTotalCoin.value = maxPlayer;
  }

  //Find the player who has largest coin value from all distributed player coins
  findPlayerWithHighestCoins() {
    int maxPlayer = 0;
    int largestCoins = 0;

    for (var element in coins) {
      if (element > largestCoins) {
        largestCoins = element;
      }
    }

    mapPlayerCoins.forEach((player, playerCoins) {
      if(playerCoins.contains(largestCoins)){
        maxPlayer = player;
      }
    });

    largestCoinValue.value = maxPlayer;
  }
}
