import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/News%20Component.dart';
import 'Component/Individual Stock Info Card.dart';
import 'Component/Individual Stock Score Card.dart';
import 'Component/Price Graph.dart';
import 'Component/Sentiment Graph.dart';

class StockInfo extends StatefulWidget {
  @override
  State<StockInfo> createState() => StockInfoState();
}

class StockInfoState extends State<StockInfo> {
  List<bool> isSelected = [true,false,false,false];

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
        return "60 Days";
      }
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child: Text("60 Days"),
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
                StockPriceCard(
                  stockTicker: "AAPL",
                  companyName: "Apple Corporation",
                  price: "149.00",
                ),
                SizedBox(height: 30,),
                StockScoreCard(
                  bullOrBear: "Bear",
                  score:"-40"
                )
              ],
            ),
            SizedBox(width: 30,),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: PriceGraph(
                    duration: extractDuration(isSelected),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: SentimentGraph(
                    duration: extractDuration(isSelected),
                  ),
                )

              ],
            )
          ],
        ),
        SizedBox(height:10),
        Container(
            height: 250,
            child: NewsComponent())


      ],
    );

  }

}