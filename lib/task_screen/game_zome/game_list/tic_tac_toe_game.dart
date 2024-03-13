import 'package:demo/core/constant/screen_util.dart';
import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({super.key});

  @override
  State<TicTacToeGame> createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<List<String>>? _board;
  String? _currentPlayer;
  bool _gameOver = false;
  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    _board = List.generate(3, (_) => List.filled(3, ''));
    _currentPlayer = 'X';
    _gameOver = false;
  }
  void _playMove(int row, int col) {
    if (!_gameOver && _board![row][col].isEmpty) {
      setState(() {
        _board![row][col] = _currentPlayer!;
        if (_checkWinner(row, col)) {
          _showWinnerDialog();
          _gameOver = true;
        } else if (_checkDraw()) {
          _showDrawDialog();
          _gameOver = true;
        } else {
          _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWinner(int row, int col) {
    // Check row
    if (_board![row][0] == _currentPlayer &&
        _board![row][1] == _currentPlayer &&
        _board![row][2] == _currentPlayer) {
      return true;
    }
    // Check column
    if (_board![0][col] == _currentPlayer &&
        _board![1][col] == _currentPlayer &&
        _board![2][col] == _currentPlayer) {
      return true;
    }
    // Check diagonals
    if ((row == col ||
        row + col == 2) &&
        (_board![0][0] == _currentPlayer &&
            _board![1][1] == _currentPlayer &&
            _board![2][2] == _currentPlayer)) {
      return true;
    }
    if ((row == 0 && col == 2) ||
        (row == 2 && col == 0) ||
        (row == 1 && col == 1)) {
      if ((_board![0][2] == _currentPlayer &&
          _board![1][1] == _currentPlayer &&
          _board![2][0] == _currentPlayer)) {
        return true;
      }
    }
    return false;
  }
  bool _checkDraw() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_board![i][j].isEmpty) {
          return false;
        }
      }
    }
    return true;
  }


  void _showWinnerDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Winner'),
        content: Text('Player $_currentPlayer wins!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _initializeBoard();
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }


  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Draw'),
        content: Text('It\'s a draw!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _initializeBoard();
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (row) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (col) => GestureDetector(
              onTap: () => _playMove(row, col),
              child: Container(
                height: 100.sp,
                width: 100.sp,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    _board![row][col],
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
            )),
          )),
        ),
      ),
    );
  }
}
