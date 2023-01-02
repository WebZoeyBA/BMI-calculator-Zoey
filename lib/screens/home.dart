import 'package:flutter/material.dart';
import 'package:bmi_calcularor_zoey/constants/app_constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bmi_calcularor_zoey/widgets/Custom_gauge.dart';
import 'package:bmi_calcularor_zoey/widgets/height_container.dart';
import 'package:bmi_calcularor_zoey/widgets/weight_container';

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
                  _weightController.text = "";
                  _heightController.text = "";
                  _resColor = Colors.black;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
