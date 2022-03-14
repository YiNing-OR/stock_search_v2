import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Date%20Control.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Line%20Graph%20Model.dart';


class SentimentGraph extends StatefulWidget {
  final String duration;

  const SentimentGraph({Key key, this.duration}) : super(key: key);

  @override
  State<SentimentGraph> createState() => SentimentGraphState();
}
class SentimentGraphState extends State<SentimentGraph> {
  int dateLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text("Sentiment Score"),
        ),
        LineGraphModel(
          spots: List<DateTime>.generate(DateControl.getDateLength(widget.duration), (i) => DateTime.now()
              .subtract(Duration(days: i))).map((x) => ChartData(x, -40)).toList(),
        )
      ],
    );
  }

}