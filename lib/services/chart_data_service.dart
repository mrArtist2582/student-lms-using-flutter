import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartDataService {
  static List<PieChartSectionData> getPieChartData() {
    return [
      PieChartSectionData(value: 30, color: Colors.green, title: 'A'),
      PieChartSectionData(value: 40, color: Colors.blue, title: 'B'),
      PieChartSectionData(value: 20, color: Colors.orange, title: 'C'),
      PieChartSectionData(value: 10, color: Colors.red, title: 'D'),
    ];
  }

  static List<BarChartGroupData> getBarChartData() {
    return [
      BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 5, color: Colors.teal)]),
      BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 7, color: Colors.teal)]),
      BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 6, color: Colors.teal)]),
    ];
  }

  static String getBarLabel(int index) {
    return ['Math', 'Science', 'English'][index];
  }

  static List<FlSpot> getLineChartData() {
    return [
      const FlSpot(0, 70),
      const FlSpot(1, 75),
      const FlSpot(2, 80),
      const FlSpot(3, 78),
      const FlSpot(4, 85),
      const FlSpot(5, 90),
    ];
  }

  static String getWeekLabel(int index) {
    return ['W1', 'W2', 'W3', 'W4', 'W5', 'W6'][index];
  }
}
