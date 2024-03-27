import 'package:demo/core/constant/screen_util.dart';
import 'package:demo/task_screen/graph_list/widget_screen/bar_graph_horizontal.dart';
import 'package:demo/task_screen/graph_list/widget_screen/bar_graph_vertical.dart';
import 'package:flutter/material.dart';

class GraphDashboard extends StatelessWidget {
  const GraphDashboard({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graph List'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          children: [
            BarGraphData(),
            BarGraphVertical(),
          ],
        ),
      ),
    );
  }

}

