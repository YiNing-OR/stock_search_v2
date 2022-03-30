import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class SentimentPieChartModel extends StatefulWidget {
  final int bear_count;
  final int neutral_count;
  final int bull_count;


  const SentimentPieChartModel({Key key,this.bear_count,this.neutral_count,this.bull_count}) : super(key: key);

  @override
  State<SentimentPieChartModel> createState() => SentimentPieChartModelState();
}
class SentimentPieChartModelState extends State<SentimentPieChartModel> {
  int dateLength;
  TooltipBehavior _tooltipBehaviour;
  @override
  void initState(){
    _tooltipBehaviour = TooltipBehavior(
        enable: true,
        format: 'point.x: point.y Articles'
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Bull', widget.bull_count, Colors.green),
      ChartData('Neutral', widget.neutral_count, Colors.amber),
      ChartData('Bear', widget.bear_count,Colors.red),
    ];
    return Column(
        children: <Widget>[
          Container(
            child: SfCircularChart(
                title: ChartTitle(text: "Breakdown of Sentiments"),
                legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                tooltipBehavior: _tooltipBehaviour,
                series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<ChartData, String>(
                      dataSource: chartData,
                      pointColorMapper:(ChartData data,  _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      dataLabelMapper: (ChartData data, _) => (data.x+" : "+data.y.toString()),
                      explode: true,
                      dataLabelSettings:
                      DataLabelSettings(
                          isVisible:true,
                          showCumulativeValues: true,
                          useSeriesColor: true,
                          textStyle: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Roboto"),
                      ),
                    //enableTooltip: true,
                  )
                ]
            )
        )]
    );
  }

}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color color;
}


// spots: List<DateTime>.generate(DateControl.getDateLength(widget.duration), (i) => DateTime.now()
//           //     .subtract(Duration(days: i))).map((x) => ChartData(x, -40)).toList(),