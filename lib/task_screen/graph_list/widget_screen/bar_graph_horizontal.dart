import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class BarGraphData extends StatelessWidget {
  BarGraphData({super.key});
  final List<GDPData> _chartData = [
    GDPData('Oceania', 1600),
    GDPData('Africa', 2490),
    GDPData('S America', 2900),
    GDPData('Europe', 23050),
    GDPData('N America', 24880),
    GDPData('Asia', 34390),
  ];
  TooltipBehavior? _tooltipBehavior;

  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonWidgets.customTextView(
          text: "Bar Graph",
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        Container(
          child: SfCartesianChart(
            title: const ChartTitle(text: 'Continent wise GDP - 2024'),
            legend: const Legend(isVisible: true),
            tooltipBehavior: _tooltipBehavior,
            series: [
              BarSeries<GDPData, String>(
                name: 'GDP',
                dataSource: _chartData,
                xValueMapper: (GDPData gdp, _) => gdp.continent,
                yValueMapper: (GDPData gdp, _) => gdp.gdp,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true,
              )
            ],
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
              title: const AxisTitle(text: 'GDP in billions of U.S. Dollars'),
            ),
          ),
        )
      ],
    );
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);

  final double gdp;
  final String continent;
}
