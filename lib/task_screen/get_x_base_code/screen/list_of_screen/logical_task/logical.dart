import 'package:demo/core/common/common_function.dart';
import 'package:demo/core/constant/screen_util.dart';
import 'package:demo/task_screen/get_x_base_code/controller/logical_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogicalScreen extends StatelessWidget {
  const LogicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LogicalController>(
      init: LogicalController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: CommonWidgets.customTextView(text: "Logical Task"),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.sp,vertical: 20.sp),
            child: Column(
              children: [
                TextField(
                  controller: controller.playerController,
                  decoration: const InputDecoration(labelText: "No of Players"),
                ),
                TextField(
                  controller: controller.coinController,
                  decoration: const InputDecoration(labelText: "No of Coins"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.sp),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.playGame();
                      controller.update();
                    },
                    child: CommonWidgets.customTextView(text: 'Play Game'),
                  ),
                ),
                if (controller.coinGame.value != null) ...[
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidgets.customTextView(
                              text: "No of Player: ${controller.coinGame.value?.noOfPlayer}",
                            ),
                            CommonWidgets.customTextView(
                              text: "No of Coins: ${controller.coinGame.value?.noOfCoins}",
                            ),
                            CommonWidgets.customTextView(
                              text: "Coins: ${controller.coins.join(",").toString()}",
                            ),
                            CommonWidgets.customTextView(
                              text: "Distributed Coins: ${controller.mapPlayerCoins}",
                            ),
                            CommonWidgets.customTextView(
                              text: "All Player with number of coins are",
                            ),
                            for (var playerCoins in controller.coinGame.value!.coinValue!)
                              Row(
                                children: [
                                  CommonWidgets.customTextView(
                                    text: "Player ${playerCoins.player} : No of Coins ${playerCoins.coins.length} : Total ${playerCoins.totalCoins}",
                                  ),
                                ],
                              ),

                            CommonWidgets.customTextView(
                              text: "${controller.maxNoOfCoinValue.value} Player has maximum Number Of Coins",
                            ),
                            CommonWidgets.customTextView(
                              text: "${controller.maxNoOfTotalCoin.value} Player has maximum Coin Value",
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ] else
                  Container(),


              ],
            ),
          ),
        );
      },
    );
  }
}
