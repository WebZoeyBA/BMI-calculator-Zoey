import 'package:flutter/material.dart';
import 'package:bmi_calcularor_zoey/constants/app_constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bmi_calcularor_zoey/widgets/Custom_gauge.dart';
import 'package:bmi_calcularor_zoey/widgets/height_container.dart';
import 'package:bmi_calcularor_zoey/widgets/weight_container';
import 'package:bmi_calcularor_zoey/models/bmi_history.dart';
import 'package:intl/intl.dart';
import 'package:bmi_calcularor_zoey/widgets/history_list.dart';

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
        date: DateTime.now());
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calculate,
              size: 70.0,
              color: Colors.grey[600],
            ),
            Text(
              "ZOEY BMI Calculator",
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
            Container(
              width: double.infinity,
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 53.0, vertical: 20.0),
              child: Material(
                child: TextField(
                  controller: _usernameController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[600],
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5)),
                    hintText: "Enter your name",
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.w300,
                        fontSize: 42),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeightContainer(heightController: _heightController),
                WeightHeightContainer(weightController: _weightController),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 20,
                side: BorderSide(
                  width: 2,
                  color: Colors.transparent,
                ),
              ),
              onPressed: () {
                addNewInstance(_usernameController.text);
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
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
            IconButton(
              iconSize: 72,
              icon: Icon(Icons.refresh),
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
            HistoryList(_userHistory),
          ],
        ),
      ),
    );
  }
}
