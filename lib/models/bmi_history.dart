import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

class HistoryInstance {
  String id;
  String username;
  DateTime date;
  double bmiResult;
  HistoryInstance(
      {required this.id,
      required this.username,
      required this.date,
      required this.bmiResult});
}
