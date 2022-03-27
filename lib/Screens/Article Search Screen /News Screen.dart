import 'package:flutter/material.dart';
import 'Components/Component/News Information Component/Component/Articles News Component.dart';
import 'Components/Component/News Information Component/Component/NewsSearchComponent.dart';
import 'Components/Component/News Information Component/Component/NewsStockInfodart';

class NewsInformationScreen extends StatelessWidget {
  final queryData;
  const NewsInformationScreen({Key key,this.queryData}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return Scaffold(
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
        NewsSearchComponent(),
        SizedBox(height:20),
        NewsStockInformation(
          // ticker: this.ticker,
          // companyName: this.companyName,
        ),
        SizedBox(height:10),
        ArticlesNewsComponent(queryData:queryData),


          ],


      ),
    );

  }

}