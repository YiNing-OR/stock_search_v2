import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class NewsSearchComponent extends StatefulWidget {
  @override
  State<NewsSearchComponent> createState() => NewsSearchComponentState();
}

class NewsSearchComponentState extends State<NewsSearchComponent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.width * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: IconButton(
                    icon: Icon(Icons.refresh,size: 35,)
                ),
              ),
            ),
            SizedBox(width: 30,),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              padding: EdgeInsets.symmetric(horizontal: 30),

              child: TextField(
                autofocus: true,
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
          ],
        ),
      ],
    );
  }

}