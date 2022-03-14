import 'package:flutter/material.dart';

class StockScoreCard extends StatefulWidget {
  final String bullOrBear;
  final String score;

  const StockScoreCard({Key key, this.bullOrBear, this.score}) : super(key: key);
  @override
  State<StockScoreCard> createState() => StockScoreCardState();
}
class StockScoreCardState extends State<StockScoreCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 50,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Overall: '+widget.bullOrBear,
              style: TextStyle(
                  fontSize: 20,
                  color: widget.bullOrBear == "Bull" ? Colors.green:Colors.red
              ),
            ),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Score: '+widget.score+"%",
              style: TextStyle(
                fontSize: 20,
                color: double.parse(widget.score)>0 ? Colors.green:Colors.red
              ),
            ),
          ),

        ],
      ),


    );

  }

}