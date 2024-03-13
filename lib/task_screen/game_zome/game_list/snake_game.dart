import 'dart:async';
import 'dart:math';

import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  int squarePerRow = 40;
  int squarePerCol = 70;

  final fontStyle = TextStyle(color: Colors.white, fontSize: 20.sp);
  final randomGen = Random();

  var snake = [
    [0, 1],
    [0, 0]
  ];
  var food = [5, 8];
  var direction = 'up';
  var isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.sp, top: 10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Score: ${snake.length - 2}',
                  style: fontStyle,
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          isPlaying
              ? Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red)
                  ),
                  child: Center(
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (direction != 'up' && details.delta.dy > 0) {
                          direction = 'down';
                        } else if (direction != 'down' && details.delta.dy < 0) {
                          direction = 'up';
                        }
                      },
                      onHorizontalDragUpdate: (details) {
                        if (direction != 'left' && details.delta.dx > 0) {
                          direction = 'right';
                        } else if (direction != 'right' && details.delta.dx < 0) {
                          direction = 'left';
                        }
                      },
                      child: AspectRatio(
                        aspectRatio: squarePerRow / (squarePerCol),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeLeft: true,
                          removeRight: true,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: squarePerRow,
                            ),
                            itemCount: squarePerRow * squarePerCol,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              var color;

                              ///  index = 43;
                              /// x = (42 % 20) = 3
                              /// y =( 42/20).floor() = 2

                              var x = index % squarePerRow;
                              var y = (index / squarePerRow).floor();

                              bool isSnakeBody = false;
                              for (var pos in snake) {
                                if (pos[0] == x && pos[1] == y) {
                                  isSnakeBody = true;
                                  break;
                                }
                              }

                              if (snake.first[0] == x && snake.first[1] == y) {
                                color = Colors.green;
                              } else if (isSnakeBody) {
                                color = Colors.green;
                              } else if (food[0] == x && food[1] == y) {
                                color = Colors.red;
                              } else {
                                color = Colors.black;
                              }
                              return Container(
                                margin: EdgeInsets.all(1.sp),
                                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              : Expanded(
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        if (isPlaying) {
                          isPlaying = false;
                        } else {
                          startGame();
                        }
                      },
                      color: Colors.green,
                      child: Text(
                        'Play',
                        style: fontStyle,
                      ),
                    ),
                  ),
                ),
          if (isPlaying)
            Padding(
              padding: EdgeInsets.only(bottom: 20.sp),
              child: MaterialButton(
                onPressed: () {
                  if (isPlaying) {
                    isPlaying = false;
                  } else {
                    startGame();
                  }
                },
                color: Colors.red,
                child: Text(
                  'End',
                  style: fontStyle,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void startGame() {
    ///should be milliseconds
    ///1 millisecond = 1/1000
    ///1 microsecond = 1/1000000
    const duration = Duration(milliseconds: 100);

    /// snake head
    snake = [
      [(squarePerRow / 2).floor(), (squarePerCol / 2).floor()]
    ];

    /// snake body
    snake.add([snake.first[0], snake.first[1] - 1]);

    createFood();

    isPlaying = true;
    Timer.periodic(duration, (timer) {
      moveSnake();
      if (checkGameOver()) {
        timer.cancel();
        endGame();
      }
    });
  }

  void createFood() {
    food = [randomGen.nextInt(squarePerRow), randomGen.nextInt(squarePerCol)];
  }

  void moveSnake() {
    setState(() {
      switch (direction) {
        case 'up':
          snake.insert(0, [snake.first[0], snake.first[1] - 1]);
          break;
        case 'down':
          snake.insert(0, [snake.first[0], snake.first[1] + 1]);
          break;
        case 'left':
          snake.insert(0, [snake.first[0] - 1, snake.first[1]]);
          break;
        case 'right':
          snake.insert(0, [snake.first[0] + 1, snake.first[1]]);
          break;
      }

      if (snake.first[0] != food[0] || snake.first[1] != food[1]) {
        snake.removeLast();
      } else {
        createFood();
      }
    });
  }

  bool checkGameOver() {
    if (!isPlaying || snake.first[1] < 0 || snake.first[1] >= squarePerCol || snake.first[0] < 0 || snake.first[0] > squarePerRow) {
      return true;
    }

    for (var i = 1; i < snake.length; ++i) {
      if (snake[i][0] == snake.first[0] && snake[i][1] == snake.first[1]) {
        return true;
      }
    }
    return false;
  }

  void endGame() {
    isPlaying = false;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text(
              'Score: ${snake.length - 2}',
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        });
  }
}

class Tile extends StatelessWidget {
  bool lightOn;

  Tile({super.key, required this.lightOn});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      color: lightOn ? Colors.white : Colors.grey[900],
    );
  }
}
