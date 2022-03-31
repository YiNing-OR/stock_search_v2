import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Article%20Search%20Screen%20/Components/Component/News%20Information%20Component/Data/obtain_news_data.dart';
import 'package:jiffy/jiffy.dart';

import 'Graphs/Date Control.dart';
import 'Individual Stock Score Card.dart';

class StockScoreCardController extends StatefulWidget {
  final String duration;


  const StockScoreCardController({Key key, this.duration}) : super(key: key);
  @override
  State<StockScoreCardController> createState() => StockScoreCardControllerState();
}
class StockScoreCardControllerState extends State<StockScoreCardController> {
  @override
  Widget build(BuildContext context) {
    int bull_count = 0;
    int neutral_count = 0;
    int bear_count = 0;
    int total =0;
    String result;


    List<DateTime> list_of_dates = List.generate(DateControl.getDateLength(widget.duration), (i) =>  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(Duration(days: i)));


    for (var query_index = 0; query_index < queryRecency.length; query_index++) {
      var date = queryRecency.values.elementAt(query_index).datePublished.toString().substring(1,queryRecency.values.elementAt(query_index).datePublished.toString().length-1);
      var dateTime_str = Jiffy(date, "dd/MM/yyyy").format("yyyy-MM-dd");
      var dateTime_dateTime = DateTime.parse(dateTime_str);
      var prediction = queryRecency.values.elementAt(query_index).predict_cat.toString().substring(1,queryRecency.values.elementAt(query_index).predict_cat.toString().length-1);


      if(list_of_dates.contains(dateTime_dateTime)){
        if(prediction=="Negative"){
          print("Negative");
          print(prediction);
          print(dateTime_str);
          bear_count+=1;
        }
        if(prediction=="Positive"){
          print("Positive");
          print(prediction);
          print(dateTime_str);

          bull_count+=1;
        }else{
          print("Neutral");
          print(prediction);
          print(dateTime_str);
          neutral_count+=1;

        }
      }
    }
    print("bull:{$bull_count}");
    print("bear:{$bear_count}");
    print("neutral:{$neutral_count}");
    total = bear_count+bull_count+neutral_count;


    //neutral same as bear
    if(neutral_count==bear_count){
      result="Bear";
    }
    //neutral same as bull
    if(neutral_count==bull_count){
      result="Bull";
    }
    //bull same as bear
    if(bear_count==bull_count){
      result="Neutral";
    }
    //case where all are equal -> Neutral
    if(neutral_count==bear_count && neutral_count==bull_count){
      result="Neutral";
    }
    //bear has the most
    if(bear_count>bull_count && bear_count>neutral_count){
      result="Bear";
    }
    //bull has the most
    if(bull_count>bear_count && bull_count>neutral_count){
      result="Bull";
    }
    //neutral has the most
    if(neutral_count>bear_count && neutral_count>bull_count){
      result="Neutral";
    }
    //no articles
    if (total==0){
      result="No Articles";
    }

    return StockScoreCard(
      bullOrBearOrNeutral: result,
    );

  }

}