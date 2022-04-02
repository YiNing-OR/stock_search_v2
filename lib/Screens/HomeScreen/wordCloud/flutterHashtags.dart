import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:ir_search_engine_stocks/Screens/HomeScreen/wordCloud/WordCloud_data.dart';

class FlutterHashtag {
  const FlutterHashtag(
      this.hashtag,
      this.color,
      this.size,
      this.rotated,
      );
  final String hashtag;
  final Color color;
  final int size;
  final bool rotated;
}

class FlutterColors {
  const FlutterColors._();

  static const Color yellow = Color(0xFFFFC108);

  static const Color white = Color(0xFFFFFFFF);

  static const Color blue400 = Color(0xFF13B9FD);
  static const Color blue600 = Color(0xFF0175C2);
  static const Color blue = Color(0xFF02569B);

  static const Color gray100 = Color(0xFFD5D7DA);
  static const Color gray600 = Color(0xFF60646B);
  static const Color gray = Color(0xFF202124);
}

 List<FlutterHashtag> kFlutterHashtags =  <FlutterHashtag>[
  FlutterHashtag(Word_list[0], FlutterColors.yellow, 70, false),
  FlutterHashtag(Word_list[1], FlutterColors.gray600, 24, false),
  FlutterHashtag(Word_list[2], FlutterColors.blue600, 12, true),
  FlutterHashtag(Word_list[3], FlutterColors.gray, 14, false),
  FlutterHashtag(Word_list[4], FlutterColors.blue400, 16, false),
  FlutterHashtag(Word_list[5], FlutterColors.blue600, 12, true),
  FlutterHashtag(Word_list[6], FlutterColors.gray600, 20, true),
  FlutterHashtag(Word_list[7], FlutterColors.blue, 36, false),
  FlutterHashtag(Word_list[8], FlutterColors.blue400, 40, false),
  FlutterHashtag(Word_list[9], FlutterColors.gray, 32, true),
  FlutterHashtag(Word_list[10], FlutterColors.gray, 12, false),
  FlutterHashtag(Word_list[11], FlutterColors.gray600, 14, false),
  FlutterHashtag(Word_list[12], FlutterColors.blue600, 16, false),
  FlutterHashtag(Word_list[13], FlutterColors.blue600, 20, true),
  FlutterHashtag(Word_list[14], FlutterColors.blue, 22, false),
  FlutterHashtag(Word_list[15], FlutterColors.gray, 30, false),
  FlutterHashtag(Word_list[16], FlutterColors.yellow, 44, false),
  FlutterHashtag(Word_list[17], FlutterColors.blue400, 30, true),
  FlutterHashtag(Word_list[18], FlutterColors.gray, 12, true),
  FlutterHashtag(Word_list[19], FlutterColors.blue600, 20, false),
  FlutterHashtag(Word_list[20], FlutterColors.gray600, 32, false),
  FlutterHashtag(Word_list[21], FlutterColors.blue600, 34, false),
  FlutterHashtag(Word_list[22], FlutterColors.gray, 12, true),
  FlutterHashtag(Word_list[23], FlutterColors.gray, 20, false),
  FlutterHashtag(Word_list[24], FlutterColors.yellow, 44, false),
  FlutterHashtag(Word_list[25], FlutterColors.blue, 32, true),
  FlutterHashtag(Word_list[26], FlutterColors.blue, 40, false),
  FlutterHashtag(Word_list[27], FlutterColors.blue400, 32, false),
  FlutterHashtag(Word_list[28], FlutterColors.blue, 20, true),
  FlutterHashtag(Word_list[29], FlutterColors.gray, 24, true),
  FlutterHashtag(Word_list[30], FlutterColors.blue, 26, false),
  FlutterHashtag(Word_list[31], FlutterColors.blue600, 28, false),
  FlutterHashtag(Word_list[32], FlutterColors.gray, 36, true),
  FlutterHashtag(Word_list[33], FlutterColors.blue, 36, false),
  FlutterHashtag(Word_list[34], FlutterColors.blue400, 40, false),
  FlutterHashtag(Word_list[35], FlutterColors.blue, 36, false),
  FlutterHashtag(Word_list[36], FlutterColors.blue400, 20, false),
  FlutterHashtag(Word_list[37], FlutterColors.blue, 12, false),
  FlutterHashtag(Word_list[38], FlutterColors.blue, 14, false),
  FlutterHashtag(Word_list[39], FlutterColors.blue, 20, false),
  FlutterHashtag(Word_list[40], FlutterColors.blue, 30, false),
  FlutterHashtag(Word_list[41], FlutterColors.blue, 22, true),
  FlutterHashtag(Word_list[42], FlutterColors.blue, 34, false),
  FlutterHashtag(Word_list[43], FlutterColors.yellow, 50, false),
];