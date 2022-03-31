import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';
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
  final String sortoption;

  const ArticleCardNews({Key key, this.sortoption, this.articleTitle, this.articleDate, this.articleSummary,this.articleLink,this.ticker_list,this.sentimentscore}) : super(key: key);
  @override
  State<ArticleCardNews> createState() => ArticleCardNewsState();
}

class ArticleCardNewsState extends State<ArticleCardNews> {

  @override
  Widget build(BuildContext context) {
    if(widget.sortoption=="Sort by Relevance") {
      return Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.75,

          child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.ticker_list.length,
                      itemBuilder: (BuildContext context, int index) {
                        String ticker = widget.ticker_list.elementAt(index)
                            .replaceAll("\'", "");
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonBar(
                              children: [
                                ElevatedButton(
                                  child: Text(ticker),
                                  onPressed: () async {
                                    await pullData(ticker);
                                    var result = await postAndFetchQuery(ticker, "ticker");
                                    queryData = queryModelFromJson(result);
                                    var result_recency = await postAndFetchQuery(ticker,"sorted_date_ticker");
                                    queryRecency = queryModelFromJson(result_recency);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IndividualStockScreen(
                                                  ticker: ticker,
                                                  companyName: "",

                                                )
                                        )
                                    );
                                  },
                                ),

                              ],
                            )
                          ],
                        );
                      }
                  ),
                ),

                new GestureDetector(
                  onTap: () async
                  {
                    if (await launch(widget.articleLink)) {} else {
                      throw "Could not launch $widget.articleLink";
                    }
                    print(widget.articleLink);

                    // launch(widget.articleLink);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.75,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      boxShadow: const [
                        BoxShadow(blurRadius: 1),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(widget.articleTitle,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 30),),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(widget.articleSummary,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(fontSize: 15),),
                              ),
                              SizedBox(width: 10),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.articleDate,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 15),),
                                      ),
                                      // Container(
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(8.0),
                                      //     child: Text(widget.articleLink,
                                      //       overflow: TextOverflow.ellipsis,
                                      //       style: TextStyle(fontSize: 15),),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      //color: Color(0xFFCFD2D5),
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Text(widget.sentimentscore == "Negative"
                                            ? "B E A R"
                                            :
                                        widget.sentimentscore == "Positive"
                                            ? "B U L L"
                                            : "NEUTRAL",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Georgia",
                                              color: widget.sentimentscore ==
                                                  "Negative" ? Colors.red :
                                              widget.sentimentscore ==
                                                  "Positive"
                                                  ? Colors.green
                                                  : Colors.amber
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ),

                      ],
                    ),


                  ),
                ),
              ]
          ),
      );
    }
    else{
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.75,

        child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.ticker_list.length,
                    itemBuilder: (BuildContext context, int index) {
                      String ticker = widget.ticker_list.elementAt(index)
                          .replaceAll("\'", "");
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonBar(
                            children: [
                              ElevatedButton(
                                child: Text(ticker),
                                onPressed: () async {
                                  await pullData(ticker);
                                  var result = await postAndFetchQuery(ticker, "ticker");
                                  queryData = queryModelFromJson(result);
                                  var result_recency = await postAndFetchQuery(ticker,"sorted_date_ticker");
                                  queryRecency = queryModelFromJson(result_recency);


                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              IndividualStockScreen(
                                                ticker: ticker,
                                                companyName: "",

                                              )
                                      )
                                  );
                                },
                              ),

                            ],
                          )
                        ],
                      );
                    }
                ),
              ),

              new GestureDetector(
                onTap: () async
                {
                  if (await launch(widget.articleLink)) {} else {
                    throw "Could not launch $widget.articleLink";
                  }
                  print(widget.articleLink);

                  // launch(widget.articleLink);
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    boxShadow: const [
                      BoxShadow(blurRadius: 1),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(widget.articleTitle,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 30),),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.articleSummary,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(fontSize: 15),),
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(widget.articleDate,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 15),),
                                    ),
                                    // Container(
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(8.0),
                                    //     child: Text(widget.articleLink,
                                    //       overflow: TextOverflow.ellipsis,
                                    //       style: TextStyle(fontSize: 15),),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    //color: Color(0xFFCFD2D5),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)),
                                  ),
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    children: [
                                      Text(widget.sentimentscore == "Negative"
                                          ? "B E A R"
                                          :
                                      widget.sentimentscore == "Positive"
                                          ? "B U L L"
                                          : "NEUTRAL",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Georgia",
                                            color: widget.sentimentscore ==
                                                "Negative" ? Colors.red :
                                            widget.sentimentscore ==
                                                "Positive"
                                                ? Colors.green
                                                : Colors.amber
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),


                ),
              ),
            ]
        ),
      );

    }

  }}