import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Data/obtainData.dart';
import 'package:ir_search_engine_stocks/Screens/Individual%20stock%20screen/Components/Stock%20Information%20Component/Models/QueryModel.dart';
import 'Components/Component/News Information Component/Component/Articles News Component.dart';
import 'Components/Component/News Information Component/Component/NewsAutoComplete_newspage.dart';
import 'Components/Component/News Information Component/Component/NewsSentimentComponent.dart';
import 'Components/Component/News Information Component/Data/obtain_news_data.dart';
var originalText;
class NewsInformationScreen extends StatelessWidget {
  //final queryData;
  final queryText;
  const NewsInformationScreen({Key key,this.queryText}) : super(key: key);

  ///returns true if same, false if different
  bool checkIfSame(){

  }

  @override
  Widget build(BuildContext context){
    String og_text = originalText;
    print("og_text: $og_text");

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
          children: <Widget>[
          ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Text("Home"),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: NewsAutoComplete_newspage(),
              ),
              SizedBox(width: 30),
              TextButton(
                onPressed: () async{
                  var result = await postAndFetchQuery(controller_News_2.text,"title");
                  queryData = queryModelFromJson(result);
                  var result_recency = await postAndFetchQuery(controller_News_2.text,"sorted_date_title");
                  queryRecency = queryModelFromJson(result_recency);
                  var queryText="";
                  queryText = await postAndFetchQuery(controller_News_2.text,"checker");
                  originalText=controller_News_2.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewsInformationScreen(
                                queryText: queryText,
                              )
                      )
                  );
                  controller_News_2.text="";
                },
                child: Text('Search',
                  style: TextStyle(fontSize: 20),),)
            ],
          ),
          SizedBox(height:20),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(width:80),
                  Container(
                      alignment: Alignment.center,
                      child:
                      Text.rich(
                        TextSpan(
                          text: 'Showing Results For: ',
                          style: TextStyle(fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                                text: queryText,
                                style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500,color:Colors.black54,fontStyle: FontStyle.italic
                                )),
                            // can add more TextSpans here...
                          ],
                        ),
                      )
                  ),
                ],
              ),
              originalText!=queryText?
              Row(
                children: [
                  SizedBox(width:80),
                  Container(
                      alignment: Alignment.center,
                      child:
                      Row(
                        children: [
                          Text('Search Instead For: ',
                            style: TextStyle(fontSize: 20)),
                          TextButton(
                            child: Text(og_text,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color:Colors.blue,
                                decoration: TextDecoration.underline
                            )
                          ),
                            onPressed:() async{
                              var result = await postAndFetchQuery(og_text,"no_spell_correct_query");
                              queryData = queryModelFromJson(result);
                              var result_recency = await postAndFetchQuery(og_text,"sorted_date_title_no_spell");
                              queryRecency = queryModelFromJson(result_recency);
                              originalText=og_text;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsInformationScreen(
                                            queryText: og_text,
                                          )
                                  )
                              );
                            },
                          ),


                        ],
                      ),

                  ),
                ],
              ):
              Container(
              ),
            ],
          ),
          SizedBox(height: 30,),
          SentimentComponent(),
          SizedBox(height:20),
          ArticlesNewsComponent(queryData:queryData),

          ],


      ),
    );

  }

}