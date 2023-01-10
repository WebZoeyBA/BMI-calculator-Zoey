import 'package:bmi_calcularor_zoey/models/bmi_history.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calcularor_zoey/models/bmi_history.dart';
import 'package:intl/intl.dart';

class HistoryList extends StatelessWidget {
  final List<HistoryInstance> history;
  HistoryList(this.history);

  double _bmiResult = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: history.map((his) {
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
                Text("$_bmiResult"),
                SizedBox(height: 10.0),
                Text(DateFormat("dd/MM/yyyy HH:m").format(his.date))
              ],
            ),
          ]),
        ),
      );
    }).toList());
  }
}
