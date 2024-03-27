import 'dart:async';
import 'dart:math';

import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraphVertical extends StatefulWidget {
   const BarGraphVertical({super.key});

  @override
  State<BarGraphVertical> createState() => _BarGraphVerticalState();
}

class _BarGraphVerticalState extends State<BarGraphVertical> {
  List<_ChartData>? _chartData = [];
  Timer? _timer;

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       CommonWidgets.customTextView(
  //         text: "Bar Graph",
  //         fontSize: 18.sp,
  //         fontWeight: FontWeight.w600,
  //       ),
  //       Container(
  //         child: SfCartesianChart(
  //             plotAreaBorderWidth: 0,
  //             primaryXAxis:
  //             const CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
  //             primaryYAxis: const NumericAxis(
  //                 majorTickLines: MajorTickLines(color: Colors.transparent),
  //                 axisLine: AxisLine(width: 0),
  //                 minimum: 0,
  //                 maximum: 100),
  //             series: _getDefaultColumnSeries()),
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    _getChartData();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _getChartData();
      });
    });
    return _buildAnimationColumnChart();
  }

  /// Get the cartesian chart
  SfCartesianChart _buildAnimationColumnChart() {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis:
        const CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
        primaryYAxis: const NumericAxis(
            majorTickLines: MajorTickLines(color: Colors.transparent),
            axisLine: AxisLine(width: 0),
            minimum: 0,
            maximum: 100),
        series: _getDefaultColumnSeries());
  }

  /// Get the column series
  List<ColumnSeries<_ChartData, num>> _getDefaultColumnSeries() {
    return <ColumnSeries<_ChartData, num>>[
      ColumnSeries<_ChartData, num>(
          dataSource: _chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y)
    ];
  }

   ///Generate random value
   int _getRandomInt(int min, int max) {
     final Random random = Random();
     return min + random.nextInt(max - min);
   }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
    _chartData!.clear();
  }

   ///Generate random data points
  void _getChartData() {
    _chartData = <_ChartData>[];
    for (int i = 1; i < 8; i++) {
      _chartData!.add(_ChartData(i, _getRandomInt(0, 100)));
    }
    _timer?.cancel();
  }
}
class _ChartData {
  _ChartData(this.x, this.y);
  final int x;
  final int y;
}
