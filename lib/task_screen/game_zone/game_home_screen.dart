import 'package:demo/core/z_file_core.dart';
import 'package:demo/my_dashboard_screen/widget/common_navigator.dart';
import 'package:demo/task_screen/game_zone/game_list_pages/snake_game.dart';
import 'package:demo/task_screen/game_zone/game_list_pages/tic_tac_toe_game.dart';
import 'package:demo/task_screen/game_zone/widget/common_grid_view_item.dart';
import 'package:flutter/material.dart';

class GameHomeScreen extends StatelessWidget {
  const GameHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text('Game Zone'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 14.sp,
            children: [
              CommonGridviewItem(
                  title: "Snake Game",
                  image: "assets/images/snake_game_app.png",
                  onTap: () {
                    CommonNavigator.navigateTo(context, className: const SnakeGame());
                  },
              ),
              CommonGridviewItem(
                title: "Tic Tac Toe",
                image: "assets/images/tictactoe_game_app.png",
                onTap: () {
                  CommonNavigator.navigateTo(context, className: const TicTacToeGame());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
