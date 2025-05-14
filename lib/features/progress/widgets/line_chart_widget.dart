import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../services/chart_data_service.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final lineSpots = ChartDataService.getLineChartData();

    return SizedBox(
      height: 200,
      child: LineChart(LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: lineSpots,
            isCurved: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
            color: Theme.of(context).colorScheme.primary,
          )
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) =>
                  Text(ChartDataService.getWeekLabel(value.toInt())),
            ),
          ),
        ),
      )),
    );
  }
}
