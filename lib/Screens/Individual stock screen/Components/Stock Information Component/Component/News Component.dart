import 'package:flutter/material.dart';
import 'NewsComponentData.dart';

class NewsComponent extends StatelessWidget {
  NewsComponent({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          ArticleCard(
            articleTitle:'Apple Hits an All Time Low',
            articleDate:'14-March-2022',
            articleSummary:"Apple's recent move in Russia led to them hitting a 52 week Low.",
            articleLink:'www.abcdef.com',
          ),
          SizedBox(   //Use of SizedBox
            height: 30,
          ),

          ArticleCard(
            articleTitle:'dddd',
            articleDate:'sss',
            articleSummary:'ddd',
            articleLink:'www.abcdef.com',
          ),
          SizedBox(   //Use of SizedBox
            height: 30,
          ),
          ArticleCard(
            articleTitle:'fff',
            articleDate:'eee',
            articleSummary:'ssss',
            articleLink:'www.abcdef.com',

          ),
          SizedBox(   //Use of SizedBox
            height: 30,
          ),

          ArticleCard(
            articleTitle:'mom',
            articleDate:'OOOeereOOO',
            articleSummary:'kjdeeeefkjkj',
            articleLink:'www.abcdef.com',
          ),
          SizedBox(   //Use of SizedBox
            height: 30,),
        ],
      ),
    );

  }
}

