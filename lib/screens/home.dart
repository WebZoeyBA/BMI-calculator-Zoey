import 'package:flutter/material.dart';
import 'package:bmi_calcularor_zoey/constants/app_constants.dart';
import 'package:bmi_calcularor_zoey/widgets/left_bar.dart';
import 'package:bmi_calcularor_zoey/widgets/right_bar.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
        title: Text(
          "Calculate your BMI",
          style:
              TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w300),
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
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  padding: EdgeInsets.all(8.0),
                  width: 150,
                  child: Material(
                    elevation: 20.0,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _heightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[800],
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                            fontWeight: FontWeight.w300,
                            fontSize: 42),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  padding: EdgeInsets.all(8.0),
                  width: 150,
                  child: Material(
                    elevation: 20,
                    shadowColor: Colors.grey[600],
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _weightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[800],
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                            fontWeight: FontWeight.w300,
                            fontSize: 42),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 2,
                  color: Colors.white,
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
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(),
            Container(
              width: 400,
              height: 400,
              padding: EdgeInsets.all(25.0),
              child: SfRadialGauge(
                title: GaugeTitle(
                  text: "BMI Meter",
                  textStyle: TextStyle(color: Colors.grey[800]),
                ),
                enableLoadingAnimation: true,
                animationDuration: 4500,
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 50,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 18.5,
                        color: Colors.blue,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                      GaugeRange(
                        startValue: 18.51,
                        endValue: 25,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                      GaugeRange(
                        startValue: 25.01,
                        endValue: 50,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        needleColor: Colors.grey[800],
                        enableAnimation: true,
                        animationDuration: 1500,
                        value: _bmiResult,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Column(
                          children: [
                            Container(
                              child: Text(
                                _bmiResult.toStringAsFixed(2),
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 200),
                            Container(
                              child: Text(
                                _textResult,
                                style: TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.w400,
                                    color: _resColor),
                              ),
                            ),
                          ],
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      )
                    ],
                  )
                ],
              ),
            ),
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
