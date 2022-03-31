import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Article%20Search%20Screen%20/News%20Screen.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Data/obtainData.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Models/QueryModel.dart';
import '../Data/obtain_news_data.dart';


class NewsSearchComponent extends StatefulWidget {
  @override
  State<NewsSearchComponent> createState() => NewsSearchComponentState();
}

class NewsSearchComponentState extends State<NewsSearchComponent> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.width * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: IconButton(
                    icon: Icon(Icons.refresh,size: 35,)
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.symmetric(horizontal: 30),

              child: TextField(
                autofocus: true,
                controller: controller,
                style: DefaultTextStyle.of(context).style.copyWith(
                    fontStyle: FontStyle.italic
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search a News",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.10,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () async {
                    var result = await postAndFetchQuery(controller.text,"title");
                    queryData = queryModelFromJson(result);
                    var result_recency = await postAndFetchQuery(controller.text,"sorted_date_title");
                    queryRecency = queryModelFromJson(result_recency);

                    controller.text="";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NewsInformationScreen()
                        )
                    );
                  },
                child: Text('Search',style: TextStyle(fontSize: 20),),
              ),
            )
          ],
        ),
      ],
    );
  }

}