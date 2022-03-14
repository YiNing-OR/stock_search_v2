import 'package:flutter/material.dart';

import 'Components/Stock Information Component/Component/Search Component.dart';
import 'Components/Stock Information Component/StockInfo.dart';

class IndividualStockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SearchComponent(),
          SizedBox(height:20),
          StockInfo(),
        ],
      ),
    );
  }
}
