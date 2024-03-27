import 'package:demo/core/constant/screen_util.dart';
import 'package:flutter/material.dart';

// class TicTacToeGame extends StatefulWidget {
//   const TicTacToeGame({super.key});
//
//   @override
//   State<TicTacToeGame> createState() => _TicTacToeGameState();
// }
//
// class _TicTacToeGameState extends State<TicTacToeGame> {
//   List<List<String>>? _board;
//   String? _currentPlayer;
//   bool _gameOver = false;
//   @override
//   void initState() {
//     super.initState();
//     _initializeBoard();
//   }
//
//   void _initializeBoard() {
//     _board = List.generate(3, (_) => List.filled(3, ''));
//     _currentPlayer = 'X';
//     _gameOver = false;
//   }
//   void _playMove(int row, int col) {
//     if (!_gameOver && _board![row][col].isEmpty) {
//       setState(() {
//         _board![row][col] = _currentPlayer!;
//         if (_checkWinner(row, col)) {
//           _showWinnerDialog();
//           _gameOver = true;
//         } else if (_checkDraw()) {
//           _showDrawDialog();
//           _gameOver = true;
//         } else {
//           _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
//         }
//       });
//     }
//   }
//
//   bool _checkWinner(int row, int col) {
//     // Check row
//     if (_board![row][0] == _currentPlayer &&
//         _board![row][1] == _currentPlayer &&
//         _board![row][2] == _currentPlayer) {
//       return true;
//     }
//     // Check column
//     if (_board![0][col] == _currentPlayer &&
//         _board![1][col] == _currentPlayer &&
//         _board![2][col] == _currentPlayer) {
//       return true;
//     }
//     // Check diagonals
//     if ((row == col ||
//         row + col == 2) &&
//         (_board![0][0] == _currentPlayer &&
//             _board![1][1] == _currentPlayer &&
//             _board![2][2] == _currentPlayer)) {
//       return true;
//     }
//     if ((row == 0 && col == 2) ||
//         (row == 2 && col == 0) ||
//         (row == 1 && col == 1)) {
//       if ((_board![0][2] == _currentPlayer &&
//           _board![1][1] == _currentPlayer &&
//           _board![2][0] == _currentPlayer)) {
//         return true;
//       }
//     }
//     return false;
//   }
//   bool _checkDraw() {
//     for (int i = 0; i < 3; i++) {
//       for (int j = 0; j < 3; j++) {
//         if (_board![i][j].isEmpty) {
//           return false;
//         }
//       }
//     }
//     return true;
//   }
//
//
//   void _showWinnerDialog() {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text('Winner'),
//         content: Text('Player $_currentPlayer wins!'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               _initializeBoard();
//             },
//             child: Text('Play Again'),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   void _showDrawDialog() {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text('Draw'),
//         content: Text('It\'s a draw!'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               _initializeBoard();
//             },
//             child: Text('Play Again'),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tic Tac Toe'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(3, (row) => Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(3, (col) => GestureDetector(
//               onTap: () => _playMove(row, col),
//               child: Container(
//                 height: 100.sp,
//                 width: 100.sp,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Center(
//                   child: Text(
//                     _board![row][col],
//                     style: TextStyle(fontSize: 40.0),
//                   ),
//                 ),
//               ),
//             )),
//           )),
//         ),
//       ),
//     );
//   }
// }



class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({super.key});

  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool ohTurn = true; // the first player is O!
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  static var myNewFont = TextStyle(color: Colors.black, letterSpacing: 3);
  static var myNewFontWhite =  TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          SizedBox(height: 15,),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player O', style: myNewFontWhite,),
                        SizedBox(
                          height: 20,
                        ),
                        Text(ohScore.toString(), style: myNewFontWhite,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player X', style: myNewFontWhite,),
                        SizedBox(
                          height: 20,
                        ),
                        Text(exScore.toString(), style: myNewFontWhite,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey.shade700)),
                      child: Center(
                        child: Text(
                          displayExOh[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('TIC TAC TOE', style: myNewFontWhite,),
                    SizedBox(height: 60,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {

    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == ''){
        displayExOh[index] = 'X';
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {

    // checks 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
    }

    // checks 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
    }

    // checks 3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }

    // checks diagonal
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    else if(filledBoxes == 9){
      _showDrawDialog();
    }

  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: <Widget>[
              TextButton(
                child: Text('Play Again!'),
                onPressed: (){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: ' + winner.toUpperCase()),
            actions: <Widget>[
              TextButton(
                child: Text('Play Again!'),
                onPressed: (){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if(winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  void _clearBoard() {

    setState(() {
      for(int i=0; i<9; i++){
        displayExOh[i] = '';
      }
    });

    filledBoxes = 0;

  }

}