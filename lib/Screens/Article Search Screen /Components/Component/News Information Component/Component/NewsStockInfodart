import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Individual%20Stock%20Price%20Card.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Individual%20Stock%20Score%20Card.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Data/obtainData.dart';
import '../Data/obtain_news_data.dart';

class NewsStockInformation extends StatefulWidget {
  var tickersMockData = TickersMockData.getData;

  @override
  State<NewsStockInformation> createState() => NewsStockInformationState();
}

class NewsStockInformationState extends State<NewsStockInformation> {
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
    return" ";
  }


  @override
  Widget build(BuildContext context){
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

        SizedBox(height:15),

        Container(
        height: 300,
        width: double.infinity,
        child: ListView(
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
            return Container(
              alignment: Alignment.center,
              height: 250,
              width: double.infinity,

              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width:70),

                  Column(

                    children: [
                      StockPriceCard(
                      stockTicker: "AAPL",
                      companyName: "Apple Inc",
                      price: "${price.substring(0, price.length - 2)}",
                      ),
                      SizedBox(height:10),


                      StockScoreCard(
                      bullOrBear: "Bear",
                      score:"-40"), ], ),

                  SizedBox(width:50),

                  Column(
                    children: [
                      StockPriceCard(
                        stockTicker: "AAPL",
                        companyName: "Apple Inc",
                        price: "${price.substring(0, price.length - 2)}",
                      ),
                      SizedBox(height:10),

                      StockScoreCard(
                          bullOrBear: "Bear",
                          score:"-40"), ], ),

                  SizedBox(width:50),

                  Column(
                    children: [
                      StockPriceCard(
                        stockTicker: "AAPL",
                        companyName: "Apple Inc",
                        price: "${price.substring(0, price.length - 2)}",
                      ),
                      SizedBox(height:10),

                      StockScoreCard(
                          bullOrBear: "Bear",
                          score:"-40"), ], ),

                  SizedBox(width:50),

              ],
            ),
        );

        } else {
        // We can show the loading view until the data comes back.
        return CircularProgressIndicator();}}
        ),
        ],
        ),
      ],
        ),
    ),],
    );

  }

}