import 'package:bmi_calcularor_zoey/models/bmi_history.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calcularor_zoey/models/bmi_history.dart';
import 'package:intl/intl.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    Key? key,
    required List<HistoryInstance> userHistory,
    required double bmiResult,
  })  : _userHistory = userHistory,
        _bmiResult = bmiResult,
        super(key: key);

  final List<HistoryInstance> _userHistory;
  final double _bmiResult;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _userHistory.map((his) {
      return Card(
        margin: EdgeInsets.only(top: 30.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 53.0, vertical: 20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text("${his.username}"),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_bmiResult.toStringAsFixed(2)),
                SizedBox(height: 10.0),
                Text(DateFormat("dd/MM/yyyy HH:mm").format(his.date))
              ],
            ),
          ]),
        ),
      );
    }).toList());
  }
}
