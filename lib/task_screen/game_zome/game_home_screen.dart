import 'package:demo/core/common/common_function.dart';
import 'package:demo/core/constant/screen_util.dart';
import 'package:demo/my_dashboard_screen/widget/common_navigator.dart';
import 'package:demo/task_screen/game_zome/game_list/snake_game.dart';
import 'package:demo/task_screen/game_zome/game_list/tic_tac_toe_game.dart';
import 'package:flutter/material.dart';

class GameHomeScreen extends StatelessWidget {
  const GameHomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    List<GameZoneModel> gameList = [
      GameZoneModel(
          title: "Snake Game",
          image: "https://www.coolmathgames.com/sites/default/files/Snake_OG-logo.jpg",
          onScreen: (){
            CommonNavigator.navigateTo(context, className: const SnakeGame());
          }
      ),
      GameZoneModel(
        title: "Tic Tac Toe Game",
        image: "https://package-service-repository-live.elo-games.com/v3/assets/tictactoe/3.0.4/480/marketing/banner/promo.png",
          onScreen: (){
            CommonNavigator.navigateTo(context, className: const TicTacToeGame());
          }
      )
    ];

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text('Game Zone'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: gameList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (context, index) {
                    GameZoneModel model = gameList[index];
                    return commonGridItem(image: model.image, title: model.title, onTap: model.onScreen);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  commonGridItem({required String image, required String title, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.sp)),
              child: Image.network(
                image,
                height: 120.sp,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 8.sp),
          CommonWidgets.customTextView(text: title, fontSize: 18.sp, fontWeight: FontWeight.bold, textAlign: TextAlign.start),
        ],
      ),
    );
  }
}

class GameZoneModel{

  final String image;
  final String title;
  VoidCallback? onScreen;

  GameZoneModel({required this.image, required this.title,this.onScreen});


}