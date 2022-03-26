import 'package:flutter/material.dart';
import 'package:ir_search_engine_stocks/Screens/Article%20Search%20Screen%20/Components/Component/News%20Information%20Component/Data/obtain_news_data.dart';
import 'Articles Card News Page.dart';

class ArticlesNewsComponent extends StatefulWidget {
  final String ticker;

  ArticlesNewsComponent({
    Key key,
    this.ticker}) : super(key: key);

  @override
  State<ArticlesNewsComponent> createState() => ArticlesNewsPageState();
}

class ArticlesNewsPageState extends State<ArticlesNewsComponent> {
  @override
  Widget build(BuildContext context) {

        return ListView.builder(
          itemCount: queryData.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
           var queryText = queryData.values.elementAt(index);
            return Column(
              children: <Widget>[
              ArticleCardNews(
                    articleTitle: queryText.title.toString().substring(3,queryText.title.toString().length-3),
                    articleDate: queryText.datePublished.toString().substring(1,queryText.datePublished.toString().length-1),
                    articleSummary: queryText.keyPoints.toString().substring(2,queryText.keyPoints.toString().length-2),
                    articleLink:'www.abcdef.com',
                    ticker:widget.ticker,
                  ),
              SizedBox(height: 30,)
              ],
            );
          },
        );



    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     ArticleCardNews(
    //       articleTitle:'Apple Hits an All Time Low',
    //       articleDate:'14-March-2022',
    //       articleSummary:"Apple's recent move in Russia led to them hitting a 52 week Low.",
    //       articleLink:'www.abcdef.com',
    //       ticker:widget.ticker,
    //
    //     ),
    //     SizedBox(   //Use of SizedBox
    //       height: 30,
    //     ),
    //
    //     ArticleCardNews(
    //       articleTitle:'dddd',
    //       articleDate:'sss',
    //       articleSummary:'ddd',
    //       articleLink:'www.abcdef.com',
    //       ticker:widget.ticker,
    //
    //     ),
    //     SizedBox(   //Use of SizedBox
    //       height: 30,
    //     ),
    //     ArticleCardNews(
    //       articleTitle:'fff',
    //       articleDate:'eee',
    //       articleSummary:'ssss',
    //       articleLink:'www.abcdef.com',
    //       ticker:widget.ticker,
    //
    //
    //     ),
    //     SizedBox(   //Use of SizedBox
    //       height: 30,
    //     ),
    //
    //     ArticleCardNews(
    //       articleTitle:'mom',
    //       articleDate:'OOOeereOOO',
    //       articleSummary:'kjdeeeefkjkj',
    //       articleLink:'www.abcdef.com',
    //       ticker:widget.ticker,
    //
    //     ),
    //     SizedBox(   //Use of SizedBox
    //       height: 30,),
    //   ],
    //   // ),
    // );

  }
}

