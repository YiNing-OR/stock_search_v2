import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Article%20Search%20Screen%20/Components/Component/News%20Information%20Component/Data/obtain_news_data.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Graphs/Date%20Control.dart';
import 'package:jiffy/jiffy.dart';
import 'sentiment_Pie_Chart_Model.dart';


class SentimentPieChart extends StatefulWidget {
  final String duration;

  const SentimentPieChart({Key key, this.duration}) : super(key: key);
  @override
  State<SentimentPieChart> createState() => SentimentPieChartState();


}
class SentimentPieChartState extends State<SentimentPieChart> {
  @override
  Widget build(BuildContext context) {
    int bull_count = 0;
    int neutral_count = 0;
    int bear_count = 0;
    int total =0;


    List<DateTime> list_of_dates = List.generate(DateControl.getDateLength(widget.duration), (i) =>  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(Duration(days: i)));


    for (var query_index = 0; query_index < queryData.length; query_index++) {
      var dateTime_str = queryData.values.elementAt(query_index).datePublished.toString().substring(1,queryData.values.elementAt(query_index).datePublished.toString().length-1);
      //var dateTime_str = Jiffy(date, "dd/MM/yyyy").format("yyyy-MM-dd");
      var dateTime_dateTime = DateTime.parse(dateTime_str);
      var prediction = queryData.values.elementAt(query_index).predict_cat.toString().substring(1,queryData.values.elementAt(query_index).predict_cat.toString().length-1);


      if(list_of_dates.contains(dateTime_dateTime)){
        if(prediction=="Negative"){
          bear_count+=1;
        }
        if(prediction=="Positive"){
          bull_count+=1;
        }
        if(prediction=="Neutral"){
          neutral_count+=1;
        }
      }
    }
    total = bear_count+bull_count+neutral_count;
    return total==0? Container(
      alignment: Alignment.center,
      child: Text("There are no articles in the past ${widget.duration} "),):
    SentimentPieChartModel(
      bear_count: bear_count,
      neutral_count: neutral_count,
      bull_count: bull_count,
    );

      // return Column(
      //   children: <Widget>[
      //
      //     // FutureBuilder(
      //     //     future: fetchStockData(),
      //     //     builder: (context,snapshot){
      //     //       if (snapshot.hasData) {
      //     //         List<ChartData> chart_data_list =[];
      //     //         for(var i=0;i<DateControl.getDateLength(widget.duration);i++){
      //     //           chart_data_list.add(ChartData(snapshot.data.keys.elementAt(i), snapshot.data.values.elementAt(i)));
      //     //         }
      //     //         return LineGraphModel(
      //     //           spots: chart_data_list,
      //     //         );
      //     //       } else {
      //     //         // We can show the loading view until the data comes back.
      //     //         return CircularProgressIndicator();
      //     //       }
      //     //     }
      //     // ),
      //
      //   ],
      // );
    }
  }
