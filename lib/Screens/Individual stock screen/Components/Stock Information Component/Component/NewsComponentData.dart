import 'package:flutter/material.dart';

class ArticleCard extends StatefulWidget {
  final String articleTitle;
  final String articleDate;
  final String articleSummary;
  final String articleLink;

  const ArticleCard({Key key, this.articleTitle, this.articleDate, this.articleSummary,this.articleLink}) : super(key: key);
  @override
  State<ArticleCard> createState() => ArticleCardState();
}

class ArticleCardState extends State<ArticleCard> {
  // var articleData=ArticleData.getData();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.articleTitle,
                  style: TextStyle(fontSize: 30),),
              ),
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

        ],
      ),


    );
}}