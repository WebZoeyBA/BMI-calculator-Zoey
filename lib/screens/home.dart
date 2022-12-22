import 'package:flutter/material.dart';
import 'package:bmi_calcularor_zoey/constants/app_constants.dart';
import 'package:bmi_calcularor_zoey/widgets/left_bar.dart';
import 'package:bmi_calcularor_zoey/widgets/right_bar.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator Zoey",
          style: TextStyle(
              color: Colors.yellowAccent, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellowAccent,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w300,
                          fontSize: 42),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellowAccent,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w300,
                          fontSize: 42),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You are overweight.";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have a normal weight.";
                  } else {
                    _textResult = "You are underweight.";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                    backgroundColor: Colors.yellowAccent,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[900]),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90.0, color: Colors.yellowAccent)),
            ),
            SizedBox(
              height: 30.0,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.yellowAccent),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bmiResult = 0;
                  _weightController.text = "";
                  _heightController.text = "";
                });
              },
              child: Text(
                "Reset",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    backgroundColor: Colors.yellowAccent,
                    color: Colors.grey[900]),
              ),
            ),
            SizedBox(height: 20.0),
            LeftBar(barWidth: 70.0),
            SizedBox(
              height: 20.0,
            ),
            LeftBar(barWidth: 40.0),
            SizedBox(
              height: 20.0,
            ),
            LeftBar(barWidth: 70.0),
            SizedBox(
              height: 30.0,
            ),
            RightBar(barWidth: 40.0),
            SizedBox(
              height: 20.0,
            ),
            RightBar(barWidth: 70.0),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
