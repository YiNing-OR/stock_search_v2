import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Date%20Control.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Graphs/Line%20Graph%20Model.dart';


class PriceGraph extends StatefulWidget {
  final String duration;

  const PriceGraph({Key key, this.duration}) : super(key: key);

  @override
  State<PriceGraph> createState() => PriceGraphState();
}
class PriceGraphState extends State<PriceGraph> {
  int dateLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text("Stock Price"),
        ),
        LineGraphModel(
          spots: List<DateTime>.generate(DateControl.getDateLength(widget.duration), (i) => DateTime.now()
              .subtract(Duration(days: i))).map((x) => ChartData(x, 100)).toList(),
        )
      ],
    );
  }

}