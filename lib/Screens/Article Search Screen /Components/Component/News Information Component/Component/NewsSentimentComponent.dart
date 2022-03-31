import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Graphs/Sentiment_Pie_Chart.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/individualStockScoreCardController.dart';


class SentimentComponent extends StatefulWidget {
  @override
  State<SentimentComponent> createState() => SentimentComponentState();
}

class SentimentComponentState extends State<SentimentComponent> {
  List<bool> isSelected = [false,false,false,true];

  String extractDuration(List isSelected){
    int correct_index;
    for (int index = 0; index< isSelected.length; index++){
      if(isSelected[index]==true)
        correct_index = index;
    }
    switch(correct_index){
      case 0:{
        return "1 Day";
      }
      break;

      case 1:{
        return "5 Days";
      }
      break;

      case 2:{
        return "30 Days";
      }
      break;

      case 3:{
        return "150 Days";
      }
      break;
    }
    return" ";
  }


  @override
  Widget build(BuildContext context){
    //pullData(widget.ticker);
    return Column(
      children: [
        ToggleButtons(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("1 Day"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("5 Days"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("30 Days"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("150 Days"),
              ),
            ],
            onPressed: (int index){
              setState(() {
                for(int buttonIndex =0; buttonIndex < isSelected.length; buttonIndex++){
                  if(buttonIndex == index){
                    isSelected[buttonIndex] = true;
                  }else{
                    isSelected[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: isSelected
        ),
        SizedBox(height:20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: SentimentPieChart(
                    duration: extractDuration(isSelected),
                  ),
                ),
                StockScoreCardController(
                  duration: extractDuration(isSelected),
                )
              ],
            ),

          ],
        ),
        SizedBox(height:10),
        // Container(
        //     height: 250,
        //     child: NewsComponent())


      ],
    );

  }

}