import 'package:flutter/material.dart';

import '../Models/DailyPricesModel.dart';
import 'package:http/http.dart' as http;

String apiKey = "03JCDPSE6W5TXWBL";
//String apiKey = "demo";

Daily stockData;
Map stockData_map = new Map();

Future<Map> getHttprequest(String symbolName) async {
  var url = Uri.parse("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol="+symbolName+"&apikey="+apiKey);
  var response = await http.get(url);
  // checks if response is successful.
  if(response.statusCode==200) {
    stockData = dailyFromJson(response.body);
  }else{
    print("Pull Failed");
  }
  print("Test");
  print(stockData);
  //for stockData, key is date,
  //var closePrice = stockData.timeSeriesDaily.values.elementAt(0).the4Close.toString();
  var testing_map = new Map();
  stockData.timeSeriesDaily.forEach((key, value) {
    testing_map[key]=value.the4Close;
    }
  );

  print("request received");
  print(testing_map);
  return testing_map;

}

Future<void> pullData(String ticker) async{
  stockData_map = await getHttprequest(ticker);
}

Future<Map> fetchStockData(){
  return Future.delayed(const Duration(seconds: 2), () => stockData_map);
}
