import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../services/chart_data_service.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = ChartDataService.getPieChartData();

    return SizedBox(
      height: 200,
      child: PieChart(PieChartData(
        sections: sections,
        sectionsSpace: 2,
        centerSpaceRadius: 40,
      )),
    );
  }
}
