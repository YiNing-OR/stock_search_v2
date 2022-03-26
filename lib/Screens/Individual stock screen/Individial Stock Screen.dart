import 'package:flutter/material.dart';
import 'Components/Stock Information Component/Component/Articles Component.dart';
import 'Components/Stock Information Component/Component/Search_Component_Stocks.dart';
import 'Components/Stock Information Component/StockInfo.dart';


class IndividualStockScreen extends StatelessWidget {
  final String ticker;
  final String companyName;
  const IndividualStockScreen({Key key, this.ticker,this.companyName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        
        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.width * 0.05),

            SearchComponentStocks(
              width: MediaQuery.of(context).size.width * 0.95,
            ),
            SizedBox(height:20),
            StockInformation(
              ticker: this.ticker,
              companyName: this.companyName,
            ),
              SizedBox(height:20),
              ArticlesComponent(),
            ],
      ),
    );
  }
}
