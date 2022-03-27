import 'package:condition/condition.dart';
import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Article%20Search%20Screen%20/Components/Component/News%20Information%20Component/Data/obtain_news_data.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Data/obtainData.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Models/QueryModel.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Individial%20Stock%20Screen.dart';

class ArticleCardNews extends StatefulWidget {
  final String articleTitle;
  final String articleDate;
  final String articleSummary;
  final String articleLink;
  final List <String> ticker_list;
  final String sentimentscore;


  const ArticleCardNews({Key key, this.articleTitle, this.articleDate, this.articleSummary,this.articleLink,this.ticker_list,this.sentimentscore}) : super(key: key);
  @override
  State<ArticleCardNews> createState() => ArticleCardNewsState();
}

class ArticleCardNewsState extends State<ArticleCardNews> {
  // var articleData=ArticleData.getData();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.ticker_list.length,
                          itemBuilder: (BuildContext context,int index){
                            String ticker =widget.ticker_list.elementAt(index).replaceAll("\'", "");
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ButtonBar(
                                  children: [
                                    ElevatedButton(
                                      child: Text(ticker),
                                      onPressed: ()async{
                                        pullData(ticker);
                                        var result = await postAndFetchQuery(ticker,"ticker");
                                        queryData = queryModelFromJson(result);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => IndividualStockScreen(
                                                  ticker: ticker,
                                                  companyName: "",

                                                )
                                            )
                                        );
                                      },
                                    ),

                                  ],
                                )],
                            );

                          }
                      ),
                    ),


                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      boxShadow: const [
                        BoxShadow(blurRadius: 1),],
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child:Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(widget.articleTitle,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 30),),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(widget.articleDate,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 15),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(widget.articleSummary,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 15),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(widget.articleLink,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 15),),
                                ),

                              ],
                            ),
                          ),
                          Positioned(
                            right:10,
                            bottom:30,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                //color: Color(0xFFCFD2D5),
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Conditioned.boolean( widget.sentimentscore=="Negative",
                                  trueBuilder: () => Text(
                                    'B E A R',
                                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontFamily:"Georgia"),
                                  ),
                                  falseBuilder: () => Text(
                                    'B U L L',
                                    style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontFamily:"Georgia"),
                                  ),
                                ),],),),

                          ),

                        ],
                      ),



                  ),]
                ),
    );
  }}