import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Article%20Search%20Screen%20/Components/Component/News%20Information%20Component/Data/obtain_news_data.dart';

import 'Graphs/Date Control.dart';
import 'Individual Stock Score Card.dart';

class StockScoreCardController extends StatefulWidget {
  final String duration;


  const StockScoreCardController({Key key, this.duration}) : super(key: key);
  @override
  State<StockScoreCardController> createState() => StockScoreCardControllerState();
}
class StockScoreCardControllerState extends State<StockScoreCardController> {

  String obtainMaxKey(int bullCount, int neutralCount, int bearCount){
    Map theMap={"Bull": bullCount, "Neutral": neutralCount, "Bear": bearCount, };

    var theValue=0.0;
    var theKey;

    theMap.forEach((k,v){
      if(v>theValue) {
        theValue = v;
        theKey = k;
      }
    });

    return (theKey);
  }
  @override
  Widget build(BuildContext context) {
    int bull_count = 0;
    int neutral_count = 0;
    int bear_count = 0;
    int total =0;
    String result;

    List<DateTime> list_of_dates = List.generate(DateControl.getDateLength(widget.duration), (i) =>  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(Duration(days: i)));

    for (var query_index = 0; query_index < queryRecency.length; query_index++) {
      var dateTime_str = queryRecency.values.elementAt(query_index).datePublished.toString().substring(1,queryRecency.values.elementAt(query_index).datePublished.toString().length-1);
      //var dateTime_str = Jiffy(date, "dd/MM/yyyy").format("yyyy-MM-dd");
      var dateTime_dateTime = DateTime.parse(dateTime_str);
      var prediction = queryRecency.values.elementAt(query_index).predict_cat.toString().substring(1,queryRecency.values.elementAt(query_index).predict_cat.toString().length-1);


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
    // print("bull:{$bull_count}");
    // print("bear:{$bear_count}");
    // print("neutral:{$neutral_count}");
    total = bear_count+bull_count+neutral_count;

    result = obtainMaxKey(bull_count, neutral_count, bear_count);
    //no articles
    if (total==0){
      result="No Articles";
    }

    return StockScoreCard(
      bullOrBearOrNeutral: result,
    );

  }

}