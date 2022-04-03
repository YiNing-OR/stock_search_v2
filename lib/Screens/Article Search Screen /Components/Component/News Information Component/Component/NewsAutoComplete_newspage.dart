import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';

TextEditingController controller_News_2;

class NewsAutoComplete_newspage extends StatefulWidget {
  @override
  NewsAutoComplete_newspageState createState() => NewsAutoComplete_newspageState();
}

class NewsAutoComplete_newspageState extends State<NewsAutoComplete_newspage> {
  bool isLoading = false;

  List<String> autoCompleteData;


  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("/titles.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();
    print("testing complete");

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return  isLoading
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Container(
      //padding: const EdgeInsets.all(16.0),
      child: Autocomplete(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          } else {
            return autoCompleteData.where((word) => word
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()));
          }
        },
        optionsViewBuilder:
            (context, Function(String) onSelected, options) {
          return Material(
            elevation: 4,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final option = options.elementAt(index);

                return ListTile(
                  // title: Text(option.toString()),
                  title: SubstringHighlight(
                    text: option.toString(),
                    term: controller_News_2.text,
                    textStyleHighlight: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  //subtitle: Text("This is subtitle"),
                  onTap: () {
                    onSelected(option.toString());
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: options.length,
            ),
          );
        },
        onSelected: (selectedString) {
          //print(selectedString);
        },
        fieldViewBuilder:
            (context, controller, focusNode, onEditingComplete) {
              controller_News_2 = controller;

          return TextField(
            controller: controller,
            focusNode: focusNode,
            onEditingComplete: onEditingComplete,
            decoration: InputDecoration(
              labelText:"Search a News",
              border: OutlineInputBorder(),
              //hintText: "Search a News",
              prefixIcon: Icon(Icons.search),
            ),
          );
        },
      ),
    );
  }
}