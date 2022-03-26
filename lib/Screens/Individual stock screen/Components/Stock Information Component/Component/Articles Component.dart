import 'package:flutter/material.dart';
import 'Articles Component Card.dart';

class ArticlesComponent extends StatefulWidget {
  ArticlesComponent({
    Key key,
  }) : super(key: key);

  @override
  State<ArticlesComponent> createState() => _ArticlesComponentState();
}

class _ArticlesComponentState extends State<ArticlesComponent> {
  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.vertical,
    //   child:
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
     // ),
    );

  }
}

