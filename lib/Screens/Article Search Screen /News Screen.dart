import 'package:flutter/material.dart';
// import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Graphs/Price%20Graph.dart';
// import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Graphs/Sentiment%20Graph.dart';
// import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Individual%20Stock%20Price%20Card.dart';
// import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Component/Individual%20Stock%20Score%20Card.dart';
// import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Data/obtainData.dart';

import 'Components/Component/News Information Component/Component/Articles Component News Page.dart';
import 'Components/Component/News Information Component/Component/NewsSearchComponent.dart';
import 'Components/Component/News Information Component/NewsInfoDay.dart';

class NewsInformationScreen extends StatelessWidget {
  final String ticker;
  final String companyName;
  const NewsInformationScreen({Key key, this.ticker,this.companyName}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
          children: <Widget>[
        NewsSearchComponent(),
        SizedBox(height:20),
        NewsStockInformation(
          // ticker: this.ticker,
          // companyName: this.companyName,
        ),
        SizedBox(height:10),
            ArticlesNewsPage(ticker:"AAPL"),


          ],


      ),
    );

  }

}