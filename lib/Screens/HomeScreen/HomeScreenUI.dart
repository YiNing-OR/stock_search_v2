import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/HomeScreen/wordCloud/WordCloud_data.dart';
import 'package:ir_search_engine_stocks/Screens/HomeScreen/wordCloud/wordCloud.dart';
import '../Article Search Screen /Components/Component/News Information Component/Component/NewsAutoComplete_main.dart';
import '../Article Search Screen /Components/Component/News Information Component/Data/obtain_news_data.dart';
import '../Article Search Screen /News Screen.dart';
import '../Individual stock screen/Components/Stock Information Component/Component/Search_Component_Stocks.dart';
import '../Individual stock screen/Components/Stock Information Component/Data/obtainData.dart';
import '../Individual stock screen/Components/Stock Information Component/Models/QueryModel.dart';
import '../Individual stock screen/Individial Stock Screen.dart';

DateTime startTime;
DateTime endTime;

class HomeScreenUI extends StatefulWidget {
  // Initial Selected Value
  // String dropdownvalue = 'Stocks';
  @override
  _HomeScreenUIState createState() => _HomeScreenUIState();
}

class _HomeScreenUIState extends State<HomeScreenUI> {
  String dropdownValue = 'News';
  String flask_url = 'http://127.0.0.1:5003';
  TextEditingController controller = TextEditingController();
  String queryInText ="";
  bool updating = false;


  @override
  Widget build(BuildContext context) {
    Word_list.shuffle();
    return updating?
        Scaffold(
          body: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10,),
              Text("Updating Data, Please Wait"),
            ],
          ))
        )

        :Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(width: 5, height: 60),
            Image.asset(
              'assets/bull_bear_logo.png',
              width: 500,
              height: 140.0,
              //fit: BoxFit.cover,
            ),
            SizedBox(width: 5, height: 60),
            Column(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(width:10),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                      onPressed: () async{
                        setState(() {
                          updating = true;
                        });
                        var updateComplete = await postAndFetchQuery("refresh","refresh");
                        print(updateComplete);
                        setState(() {
                          updating = false;
                        });
                      },
                   ),

                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: dropdownValue == "Stocks"?
                    SearchComponentStocks(
                      width: MediaQuery.of(context).size.width * 0.8,
                    ) :
                    NewsAutoComplete(),

                    // TextField(
                    //   controller: controller,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: "Search a News",
                    //     prefixIcon: Icon(Icons.search),
                    //   ),
                    //),
                  ),
                  SizedBox( width: MediaQuery.of(context).size.width * 0.01),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black45),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Stocks', 'News']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  //SizedBox( width: MediaQuery.of(context).size.width * 0.001),
                  Expanded(
                        child:TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () async {
                            if (dropdownValue == "Stocks") {
                              String ticker = controller_typeahead_stocks.text.toUpperCase();
                              print("test");
                              print(ticker);
                              await pullData(ticker);
                              //pull data for relevant news
                              var result = await postAndFetchQuery(ticker,"ticker");
                              queryData = queryModelFromJson(result);
                              var result_recency = await postAndFetchQuery(ticker,"sorted_date_ticker");
                              queryRecency = queryModelFromJson(result_recency);
                              controller_typeahead_stocks.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IndividualStockScreen(
                                        ticker: ticker,
                                        companyName: " ",
                                      )
                                  ));
                              startTime = DateTime.now();
                              //ticker="";
                            }

                            else if (dropdownValue == "News") {
                              //if(dropdownValue=="News")
                              var result = await postAndFetchQuery(controller_News.text,"title");
                              queryData = queryModelFromJson(result);
                              var result_recency = await postAndFetchQuery(controller_News.text,"sorted_date_title");
                              queryRecency = queryModelFromJson(result_recency);
                              var queryText="";
                              queryText = await postAndFetchQuery(controller_News.text,"checker");
                              originalText=controller_News.text;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsInformationScreen(
                                            queryText: queryText,
                                          )
                                  )
                              );
                              controller_News.text="";
                              startTime = DateTime.now();
                            }

                          },
                          child: Text('Search',style: TextStyle(fontSize: 20),),
                        ),
                      )
                ]
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    child: WordCloudExample(),
                    width: 1000,
                ),

              ],
            ),


            // TextButton(
            //     onPressed: ()  async{
            //       var result = await postAndFetchQuery(
            //           controller_News.text,"title"
            //       );
            //       print(result);
            //
            //       var queryData = queryModelFromJson(result);
            //       queryRecency = queryModelFromJson(result);
            //       print("testing");
            //       print(queryRecency);
            //
            //       var date = queryData.values.elementAt(1).datePublished.toString().substring(1,queryData.values.elementAt(1).datePublished.toString().length-1);
            //        var prediction = queryData.values.elementAt(0).predict_cat.toString();
            //        print(prediction);
            //       List<DateTime> days = List.generate(3, (i) =>  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).subtract(Duration(days: i)));
            //       print(days);
            //        // print(x.runtimeType);
            //        // print(date);
            //        // print(dateTime.runtimeType);
            //        // print(dateTime);
            //       print(queryData.length);
            //
            //       queryInText = queryRecency.values.elementAt(0).datePublished.toString();
            //       setState(() {
            //         //print(result);
            //       });
            //     },
            //     child: Text(
            //       'Fetch data from flask',
            //       style: TextStyle(fontSize: 20),
            //     )),
            // SizedBox(height: 40,),
            // Text("Title of First Article: ",style: TextStyle(fontSize: 20)),
            // SizedBox(height:10),
            // Text(queryInText,style: TextStyle(fontSize: 20)),

          ],
        ),
      ),
    );
  }
}
