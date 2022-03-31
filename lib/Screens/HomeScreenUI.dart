import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'Article Search Screen /Components/Component/News Information Component/Data/obtain_news_data.dart';
import 'Article Search Screen /News Screen.dart';
import 'Individual stock screen/Components/Stock Information Component/Component/Search_Component_Stocks.dart';
import 'Individual stock screen/Components/Stock Information Component/Data/obtainData.dart';
import 'Individual stock screen/Components/Stock Information Component/Models/QueryModel.dart';

class HomeScreenUI extends StatefulWidget {
  // Initial Selected Value
  // String dropdownvalue = 'Stocks';
  @override
  _HomeScreenUIState createState() => _HomeScreenUIState();
}

class _HomeScreenUIState extends State<HomeScreenUI> {
  String dropdownValue = 'Stocks';
  String flask_url = 'http://127.0.0.1:5003';
  TextEditingController controller = TextEditingController();
  String queryInText ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(width: 5, height: 60),
          Image.asset(
            'assets/bull_bear_logo.png',
            width: 500,
            height: 140.0,
            //fit: BoxFit.cover,
          ),
          SizedBox(width: 5, height: 60),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            SizedBox(
              width: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: dropdownValue == "Stocks"?
              SearchComponentStocks(
                width: MediaQuery.of(context).size.width * 0.8,
              )
                  :
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search a News",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(width: 20),
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
          ]
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child:TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () async {
                if (dropdownValue == "Stocks") {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             IndividualStockScreen(ticker: "DND.TRT",
                  //               companyName: "Apple Inc",)));
                }

                else if (dropdownValue == "News") {
                  //if(dropdownValue=="News")
                  var result = await postAndFetchQuery(controller.text,"title");
                  queryData = queryModelFromJson(result);
                  var result_recency = await postAndFetchQuery(controller.text,"sorted_date_title");
                  queryRecency = queryModelFromJson(result_recency);


                  // print(result_recency);
                  //
                  // print("here on");
                  // print(result);
                  controller.text="";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewsInformationScreen()
                      )
                  );
                }

              },
              child: Text('Search',style: TextStyle(fontSize: 20),),
            ),
          )
          ,

          // TextButton(
          //     onPressed: ()  async{
          //       var result = await postAndFetchQuery(
          //         controller.text,"title"
          //       );
          //       var queryData = queryModelFromJson(result);
          //       queryRecency = queryModelFromJson(result);
          //
          //       var date = queryData.values.elementAt(1).datePublished.toString().substring(1,queryData.values.elementAt(1).datePublished.toString().length-1);
          //        var prediction = queryData.values.elementAt(0).predict_cat.toString().substring(1,queryData.values.elementAt(1).predict_cat.toString().length-1);
          //        var dateTime_str = Jiffy(date, "dd/MM/yyyy").format("yyyy-MM-dd");
          //        var dateTime = DateTime.parse(dateTime_str);
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
    );
  }
}
