import 'package:demo/task_screen/stories_view_app/util/progress_bar.dart';
import 'package:flutter/material.dart';


class MyStoryBars extends StatelessWidget {
  List<double> percentWatched = [];

  MyStoryBars({required this.percentWatched});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70),
      child: Row(
        children: [
          Expanded(
            child: MyProgressBar(percentWatched: percentWatched[0]),
          ),
          Expanded(
            child: MyProgressBar(percentWatched: percentWatched[1]),
          ),
          Expanded(
            child: MyProgressBar(percentWatched: percentWatched[2]),
          ),
        ],
      ),
    );
  }
}