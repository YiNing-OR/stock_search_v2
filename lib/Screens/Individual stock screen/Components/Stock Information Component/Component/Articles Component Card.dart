import 'package:condition/condition.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatefulWidget {
  final String articleTitle;
  final String articleDate;
  final String articleSummary;
  final String articleLink;
  final double sentimentscore;

  const ArticleCard({Key key, this.articleTitle, this.articleDate, this.articleSummary,this.articleLink,this.sentimentscore}) : super(key: key);
  @override
  State<ArticleCard> createState() => ArticleCardState();
}

class ArticleCardState extends State<ArticleCard> {
  // var articleData=ArticleData.getData();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: const [
          BoxShadow(blurRadius: 1),

        ],
      ),
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        Positioned(
          right:50,
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
              children: [Conditioned.boolean( widget.sentimentscore>=-100&&widget.sentimentscore<=0,
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


    );
}}