import 'dart:convert';

SearchSymbol searchSymbolFromMap(String str) => SearchSymbol.fromMap(json.decode(str));

String searchSymbolToMap(SearchSymbol data) => json.encode(data.toMap());

class SearchSymbol {
  SearchSymbol({
    this.bestMatches,
  });

  List<BestMatch> bestMatches;

  factory SearchSymbol.fromMap(Map<String, dynamic> json) => SearchSymbol(
    bestMatches: List<BestMatch>.from(json["bestMatches"].map((x) => BestMatch.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "bestMatches": List<dynamic>.from(bestMatches.map((x) => x.toMap())),
  };
}

class BestMatch {
  BestMatch({
    this.the1Symbol,
    this.the2Name,
    this.the3Type,
    this.the4Region,
    this.the5MarketOpen,
    this.the6MarketClose,
    this.the7Timezone,
    this.the8Currency,
    this.the9MatchScore,
  });

  String the1Symbol;
  String the2Name;
  String the3Type;
  String the4Region;
  String the5MarketOpen;
  String the6MarketClose;
  String the7Timezone;
  String the8Currency;
  String the9MatchScore;

  factory BestMatch.fromMap(Map<String, dynamic> json) => BestMatch(
    the1Symbol: json["1. symbol"],
    the2Name: json["2. name"],
    the3Type: json["3. type"],
    the4Region: json["4. region"],
    the5MarketOpen: json["5. marketOpen"],
    the6MarketClose: json["6. marketClose"],
    the7Timezone: json["7. timezone"],
    the8Currency: json["8. currency"],
    the9MatchScore: json["9. matchScore"],
  );

  Map<String, dynamic> toMap() => {
    "1. symbol": the1Symbol,
    "2. name": the2Name,
    "3. type": the3Type,
    "4. region": the4Region,
    "5. marketOpen": the5MarketOpen,
    "6. marketClose": the6MarketClose,
    "7. timezone": the7Timezone,
    "8. currency": the8Currency,
    "9. matchScore": the9MatchScore,
  };
}
