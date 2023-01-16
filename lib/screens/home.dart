import 'package:bmi_calcularor_zoey/widgets/history_list.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calcularor_zoey/widgets/Custom_gauge.dart';
import 'package:bmi_calcularor_zoey/widgets/textfield_containers/height_container.dart';
import 'package:bmi_calcularor_zoey/widgets/textfield_containers/weight_container.dart';
import 'package:bmi_calcularor_zoey/widgets/textfield_containers/name_container.dart';
import 'package:bmi_calcularor_zoey/models/bmi_history.dart';
import 'package:intl/intl.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final List<HistoryInstance> _userHistory = [];

  void addNewInstance(String usernameIns) {
    final newIns = HistoryInstance(
        id: DateTime.now().toString(),
        username: usernameIns,
        date: DateTime.now(),
        bmiResult: _bmiResult);
    print(newIns.bmiResult);
    setState(() {
      _userHistory.add(newIns);
    });
  }

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  String usernameInput = "";
  double _bmiResult = 0;
  String _textResult = "";
  Color _resColor = Color.fromARGB(235, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NeumorphicIcon(
              Icons.calculate,
              size: 70.0,
              style: NeumorphicStyle(color: Colors.white, depth: 2),
            ),
            Text(
              "BMI Calculator",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NameContainer(usernameController: _usernameController),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeightContainer(heightController: _heightController),
                WeightContainer(weightController: _weightController)
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                color: Colors.grey[200],
                depth: 7,
              ),
              onPressed: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You are overweight.";
                    _resColor = Colors.red;
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You are fit.";
                    _resColor = Colors.green;
                  } else {
                    _textResult = "You are underweight.";
                    _resColor = Colors.blueAccent;
                  }
                });
                addNewInstance(_usernameController.text);
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
              ),
            ),
            SizedBox(),
            CustomGauge(
                bmiResult: _bmiResult,
                textResult: _textResult,
                resColor: _resColor),
            SizedBox(
              height: 30.0,
            ),
            NeumorphicButton(
              style: NeumorphicStyle(color: Colors.grey[200], depth: 5),
              child: Icon(
                Icons.refresh,
                color: Colors.grey[600],
              ),
              onPressed: () {
                setState(() {
                  _bmiResult = 0;
                  _textResult = "";
                  _usernameController.text = "";
                  _weightController.text = "";
                  _heightController.text = "";
                  _resColor = Colors.black;
                });
              },
            ),
            HistoryList(userHistory: _userHistory)
          ],
        ),
      ),
    );
  }
}
