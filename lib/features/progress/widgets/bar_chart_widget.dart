import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../services/chart_data_service.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final barGroups = ChartDataService.getBarChartData();

    return SizedBox(
      height: 250,
      child: BarChart(
        BarChartData(
          barGroups: barGroups,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) =>
                    Text(ChartDataService.getBarLabel(value.toInt())),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
