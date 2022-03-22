import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TestGraphModel extends StatefulWidget {
  final String duration;
  final List spots;
  final String title; //Title of graph (Sentiment/Price)

  const TestGraphModel({Key key, this.duration, this.spots, this.title}) : super(key: key);
  @override
  State<TestGraphModel> createState() => TestGraphModelState();
}
class TestGraphModelState extends State<TestGraphModel> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData2()
    );
  }
}
List<LineChartBarData> linesBarData2() {
  return [
    LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 4),
        FlSpot(5, 1.8),
        FlSpot(7, 5),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      curveSmoothness: 0,
      colors: const [
        Color(0x444af699),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: true,
      ),
    ),
  ];
}

LineChartData sampleData2() {
  return LineChartData(
    lineTouchData: LineTouchData(
      enabled: false,
    ),
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,

        margin: 10,
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'SEPT';
            case 7:
              return 'OCT';
            case 12:
              return 'DEC';
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,

        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '1m';
            case 2:
              return '2m';
            case 3:
              return '3m';
            case 4:
              return '5m';
            case 5:
              return '6m';
          }
          return '';
        },
        margin: 8,
        reservedSize: 30,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        )),
    minX: 0,
    maxX: 14,
    maxY: 6,
    minY: 0,
    lineBarsData: linesBarData2(),
  );
}
