import 'package:flutter/material.dart';
import 'Components/Stock Information Component/Component/News Component.dart';
import 'Components/Stock Information Component/Component/Search Component.dart';
import 'Components/Stock Information Component/StockInfo.dart';


class IndividualStockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        
        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[

          SearchComponent(),
          SizedBox(height:20),
          // SingleChildScrollView(
          //   scrollDirection: Axis.vertical,
          //   child: StockInformation(),
          //   SingleChildScrollView(
          //     scrollDirection: Axis.vertical,
          //     child: StockInformation(),
          // ),
          StockInformation(),
            SizedBox(height:20),
            NewsComponent(),
          ],
      ),
    );
  }
}
