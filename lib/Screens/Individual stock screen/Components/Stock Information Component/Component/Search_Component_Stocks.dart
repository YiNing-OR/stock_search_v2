import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import '../../../Individial Stock Screen.dart';
import '../Data/obtainData.dart';
import '../Models/SearchSymbolModel.dart';


class SearchComponentStocks extends StatefulWidget {
  final width;
  const SearchComponentStocks({Key key, this.width}) : super(key: key);

  @override
  State<SearchComponentStocks> createState() => SearchComponentStocksState();
}

class SearchComponentStocksState extends State<SearchComponentStocks> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //SizedBox(height: MediaQuery.of(context).size.width * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Expanded(
            //   child: Container(
            //     child: IconButton(
            //         icon: Icon(Icons.refresh,size: 35,)
            //     ),
            //   ),
            // ),
            // SizedBox(width: 30,),

            //MediaQuery.of(context).size.width * 0.95,
            Container(
              width: widget.width,

                child: TypeAheadField(
                debounceDuration: Duration(milliseconds: 500),
                hideOnEmpty: true,
                textFieldConfiguration: TextFieldConfiguration(
                    autofocus: true,
                    controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Search a Stock",
                        prefixIcon: Icon(Icons.search),
                    )
                ),
                suggestionsCallback: (pattern) async {
                  String apiKey = "03JCDPSE6W5TXWBL";

                  String searchApi = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords="+pattern+"&apikey="+apiKey;
                  if (pattern ==null|| pattern ==""){
                    return null;
                  }
                  var url = Uri.parse(searchApi);
                  var response = await http.get(url);
                  if(response.statusCode==200){
                    SearchSymbol searchResults = searchSymbolFromMap(response.body);
                    return searchResults.bestMatches;
                  }
                  return null;
                },
                itemBuilder: (context, BestMatch suggestion) {
                  if(suggestion == null){return Container();}
                  return ListTile(
                    leading: Icon(Icons.search),
                    title: Text(suggestion.the2Name),
                    subtitle: Text("Symbol: "+suggestion.the1Symbol),
                  );
                },
                onSuggestionSelected: (BestMatch suggestion) {
                  pullData(suggestion.the1Symbol);
                  controller.clear();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IndividualStockScreen(
                            ticker: suggestion.the1Symbol,
                            companyName: suggestion.the2Name,
                          )
                      )
                  );

                },
              )
            )
          ],
        ),
      ],
    );
  }

}