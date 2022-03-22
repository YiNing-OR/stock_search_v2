import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Graphs/Date%20Control.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Graphs/Line%20Graph%20Model.dart';

import '../../Data/obtainData.dart';


class PriceGraph extends StatefulWidget {
  final String duration;

  const PriceGraph({Key key, this.duration}) : super(key: key);

  @override
  State<PriceGraph> createState() => PriceGraphState();
}
class PriceGraphState extends State<PriceGraph> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text("Stock Price"),
        ),
        FutureBuilder(
            future: fetchStockData(),
            builder: (context,snapshot){
              if (snapshot.hasData) {
                List<ChartData> chart_data_list =[];
                for(var i=0;i<DateControl.getDateLength(widget.duration);i++){
                  chart_data_list.add(ChartData(snapshot.data.keys.elementAt(i), snapshot.data.values.elementAt(i)));
                }
                return LineGraphModel(
                  spots: chart_data_list,
                );
              } else {
                // We can show the loading view until the data comes back.
                return CircularProgressIndicator();
              }
            }
        ),

      ],
    );
  }

}