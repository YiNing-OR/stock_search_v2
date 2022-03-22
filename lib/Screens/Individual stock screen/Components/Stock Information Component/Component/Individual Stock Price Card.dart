import 'package:flutter/material.dart';


class StockPriceCard extends StatefulWidget {
  final String stockTicker;
  final String companyName;
  final String price;

  const StockPriceCard({Key key, this.stockTicker, this.companyName,this.price}) : super(key: key);
  @override
  State<StockPriceCard> createState() => StockPriceCardState();
}
class StockPriceCardState extends State<StockPriceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: const [
          BoxShadow(blurRadius: 1),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.stockTicker,
                        style: TextStyle(fontSize: 30),),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.companyName,
                        style: TextStyle(fontSize: 15),),
                    ),
                  ),
                ],
            ),
             ),

      Expanded(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$'+widget.price,
                    style: TextStyle(fontSize: 30),),
                ),
                )],
            ),
      ),
        ],
      ),


      );

  }

}