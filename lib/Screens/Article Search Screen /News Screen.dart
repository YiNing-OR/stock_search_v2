import 'package:flutter/material.dart';
import 'Components/Component/News Information Component/Component/Articles News Component.dart';
import 'Components/Component/News Information Component/Component/NewsSearchComponent.dart';
import 'Components/Component/News Information Component/Component/NewsInfoDay.dart';

class NewsInformationScreen extends StatelessWidget {
  final String ticker;
  final String companyName;
  final queryData;
  const NewsInformationScreen({Key key, this.ticker,this.companyName,this.queryData}) : super(key: key);

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
        ArticlesNewsComponent(ticker:"AAPL"),


          ],


      ),
    );

  }

}