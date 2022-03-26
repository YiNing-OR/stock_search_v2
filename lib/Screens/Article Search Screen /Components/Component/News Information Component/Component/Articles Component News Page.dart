import 'package:flutter/material.dart';
import 'Articles Card News Page.dart';

class ArticlesNewsPage extends StatefulWidget {
  final String ticker;

  ArticlesNewsPage({
    Key key,
    this.ticker}) : super(key: key);

  @override
  State<ArticlesNewsPage> createState() => ArticlesNewsPagetState();
}

class ArticlesNewsPagetState extends State<ArticlesNewsPage> {
  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.vertical,
    //   child:
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ArticleCardNews(
          articleTitle:'Apple Hits an All Time Low',
          articleDate:'14-March-2022',
          articleSummary:"Apple's recent move in Russia led to them hitting a 52 week Low.",
          articleLink:'www.abcdef.com',
          ticker:widget.ticker,

        ),
        SizedBox(   //Use of SizedBox
          height: 30,
        ),

        ArticleCardNews(
          articleTitle:'dddd',
          articleDate:'sss',
          articleSummary:'ddd',
          articleLink:'www.abcdef.com',
          ticker:widget.ticker,

        ),
        SizedBox(   //Use of SizedBox
          height: 30,
        ),
        ArticleCardNews(
          articleTitle:'fff',
          articleDate:'eee',
          articleSummary:'ssss',
          articleLink:'www.abcdef.com',
          ticker:widget.ticker,


        ),
        SizedBox(   //Use of SizedBox
          height: 30,
        ),

        ArticleCardNews(
          articleTitle:'mom',
          articleDate:'OOOeereOOO',
          articleSummary:'kjdeeeefkjkj',
          articleLink:'www.abcdef.com',
          ticker:widget.ticker,

        ),
        SizedBox(   //Use of SizedBox
          height: 30,),
      ],
      // ),
    );

  }
}

