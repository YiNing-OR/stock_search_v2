import 'package:flutter/material.dart';
import 'Individual stock screen/Components/Stock Information Component/Component/Search Component.dart';
import 'Individual stock screen/Components/Stock Information Component/Data/obtainData.dart';
import 'Individual stock screen/Individial Stock Screen.dart';

class HomeScreenUI extends StatefulWidget {
  // Initial Selected Value
  // String dropdownvalue = 'Stocks';
  @override
  _HomeScreenUIState createState() => _HomeScreenUIState();
}

class _HomeScreenUIState extends State<HomeScreenUI> {
  String dropdownValue = 'Stocks';
  //
  // var items = [
  //   'Stocks',
  //   'News',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(width: 5, height: 60),
          Image.asset(
            'assets/bull_bear_logo.png',
            width: 500,
            height: 140.0,
            //fit: BoxFit.cover,
          ),
          SizedBox(width: 5, height: 60),
          Row(children: [
            SizedBox(
              width: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search a Stock or News",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                elevation: 16,
                style: const TextStyle(color: Colors.black45),
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Stocks', 'News']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ]),
          SizedBox(
            height: 100,
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              pullData("AAPL");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IndividualStockScreen(
                        ticker: "AAPL",
                        companyName: "Apple Inc",
                      )));
            },
            child: Text('Placeholder button: press for next page'),
          ),
        ],
      ),
    );
  }
}
