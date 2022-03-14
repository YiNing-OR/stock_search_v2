import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineGraphModel extends StatefulWidget {
  final String duration;
  final List spots;
  final String title; //Title of graph (Sentiment/Price)

  const LineGraphModel({Key key, this.duration, this.spots, this.title}) : super(key: key);
  @override
  State<LineGraphModel> createState() => LineGraphModelState();
}
class LineGraphModelState extends State<LineGraphModel> {
  TooltipBehavior _tooltipBehavior;


  @override
  void initState(){
    _tooltipBehavior =  TooltipBehavior(enable: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.5,
      height: 125,
      child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
        // Initialize category axis
          primaryXAxis: CategoryAxis(
            isInversed: true
          ),
          series: <ChartSeries>[
            // Initialize line series
            LineSeries<ChartData, String>(
                enableTooltip: true,
                dataSource: widget.spots,
                xValueMapper: (ChartData data, _) => data.x.toString().substring(0, data.x.toString().indexOf(' ')),
                yValueMapper: (ChartData data, _) => data.y,

            )
          ]
      )
    );
  }

}
class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}