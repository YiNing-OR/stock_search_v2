import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/HomeScreen/HomeScreenUI.dart';
import '../Article Search Screen /Components/Component/News Information Component/Component/Articles News Component.dart';
import '../Article Search Screen /Components/Component/News Information Component/Data/obtain_news_data.dart';
import 'Components/Stock Information Component/Component/Search_Component_Stocks.dart';
import 'Components/Stock Information Component/StockInfo.dart';


class IndividualStockScreen extends StatelessWidget {
  final String ticker;
  final String companyName;
  const IndividualStockScreen({Key key, this.ticker,this.companyName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    endTime = DateTime.now();
    var totalTime = endTime.difference(startTime).inMicroseconds/1000000;
       try {return Scaffold(
        
        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("Home"),

            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.05),

            SearchComponentStocks(
              width: MediaQuery.of(context).size.width * 0.95,
            ),
            Row(
              children: [
                SizedBox(width:35),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text.rich(
                    TextSpan(
                      text: 'Time Taken: ',
                      style: TextStyle(fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: totalTime.toString(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500,color:Colors.black54,fontStyle: FontStyle.italic
                            )),
                        TextSpan(
                            text: ' seconds',
                            style: TextStyle(fontSize: 15),
                            )

                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:20),
            StockInformation(
              ticker: this.ticker,
              companyName: this.companyName,
              queryData: queryData,
            ),
              SizedBox(height:20),
              ArticlesNewsComponent(queryData:queryData),
            ],
      ),
    );
      }catch(e){
        CircularProgressIndicator();
      }
  }
}
