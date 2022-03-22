import '../Models/DailyPricesModel.dart';
import 'package:http/http.dart' as http;

String apiKey = "03JCDPSE6W5TXWBL";
Daily stockData;

Future<String> getHttprequest(String symbolName) async {
  var url = Uri.parse("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol="+symbolName+"&apikey="+apiKey);
  var response = await http.get(url);
  // checks if response is successful.
  if(response.statusCode==200) {
    stockData = dailyFromJson(response.body);
  }
  //for stockData, key is date,
  var closePrice = stockData.timeSeriesDaily.values.elementAt(0).the4Close.toString();

  // var stock_Map = new Map();
  // stock_Map["1 Day"] = stockData.timeSeriesDaily.values.elementAt(0).the4Close.toString();
  // stock_Map["5 Day"] = [];
  // for (var i=0;i<5;i++){
  //   stock_Map["5 Day"][i]=stockData.timeSeriesDaily.values.elementAt(i).the4Close.toString();
  // }
  // stock_Map["30 Day"] = [];
  // for (var i=0;i<30;i++){
  //   stock_Map["30 Day"][i]=stockData.timeSeriesDaily.values.elementAt(i).the4Close.toString();
  // }
  // stock_Map["60 Day"] = [];
  // for (var i=0;i<60;i++){
  //   stock_Map["60 Day"][i]=stockData.timeSeriesDaily.values.elementAt(i).the4Close.toString();
  // }

  print("request received");
  //print(stock_Map);
  return closePrice;
}

