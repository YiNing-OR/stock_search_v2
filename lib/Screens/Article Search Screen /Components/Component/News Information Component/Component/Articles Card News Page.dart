import 'package:flutter/material.dart';

class ArticleCardNews extends StatefulWidget {
  final String articleTitle;
  final String articleDate;
  final String articleSummary;
  final String articleLink;
  final String ticker;


  const ArticleCardNews({Key key, this.articleTitle, this.articleDate, this.articleSummary,this.articleLink,this.ticker}) : super(key: key);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonBar(
                          children: [
                          ElevatedButton(
                            child: Text(widget.ticker),
                            onPressed: (){},
                          ),
                          ElevatedButton(
                            child: Text(widget.ticker),
                            onPressed: (){},
                          ),
                        ],
                      )],
                    ),
                  Container(
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(widget.articleTitle,
                                        style: TextStyle(fontSize: 30),),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(widget.articleDate,
                                    style: TextStyle(fontSize: 15),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(widget.articleSummary,
                                    style: TextStyle(fontSize: 15),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(widget.articleLink,
                                    style: TextStyle(fontSize: 15),),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),



                  ),]
                ),
    );
  }}