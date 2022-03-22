import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  @override
  State<SearchComponent> createState() => SearchComponentState();
}

class SearchComponentState extends State<SearchComponent> {

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

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

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your Search",
                  prefixIcon: Icon(Icons.search),

                ),
                controller: _textController,

              ),
            )
          ],
        ),
      ],
    );
  }

}