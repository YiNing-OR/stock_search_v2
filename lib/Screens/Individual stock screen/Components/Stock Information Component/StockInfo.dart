import 'package:flutter/material.dart';
import '../../../Article Search Screen /Components/Component/News Information Component/Data/obtain_news_data.dart';
import 'Component/Graphs/Sentiment_Pie_Chart.dart';
import 'Component/Individual Stock Price Card.dart';
import 'Component/Individual Stock Score Card.dart';
import 'Component/Graphs/Price Graph.dart';
import 'Component/individualStockScoreCardController.dart';
import 'Data/obtainData.dart';

class StockInformation extends StatefulWidget {
  final String ticker;
  final String companyName;
  final queryData;
  const StockInformation({Key key, this.ticker,this.companyName,this.queryData}) : super(key: key);
  @override
  State<StockInformation> createState() => StockInformationState();
}

class StockInformationState extends State<StockInformation> {
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
                FutureBuilder(
                    future: fetchStockData(),
                    builder: (context,snapshot){
                      if (snapshot.hasData) {
                        String price = snapshot.data.values.first;
                        // Build the widget with data.
                        return Column(
                          children: [
                            StockPriceCard(
                              stockTicker: widget.ticker,
                              companyName: widget.companyName,
                              price: "${price.substring(0, price.length - 2)}",
                            ),
                          ],
                        );
                      } else {
                        // We can show the loading view until the data comes back.
                        return CircularProgressIndicator();
                      }
                    }
                ),
                SizedBox(height: 30,),
                StockScoreCardController(
                  duration: extractDuration(isSelected),
                )
              ],
            ),
            SizedBox(width: 30,),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 150,
                  child: PriceGraph(
                    duration: extractDuration(isSelected),
                  ),
                  // child: TestGraphModel(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: SentimentPieChart(
                    duration: extractDuration(isSelected),
                  ),
                )

              ],
            )
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