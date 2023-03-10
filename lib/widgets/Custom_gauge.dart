import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomGauge extends StatelessWidget {
  const CustomGauge({
    Key? key,
    required double bmiResult,
    required String textResult,
    required Color resColor,
  })  : _bmiResult = bmiResult,
        _textResult = textResult,
        _resColor = resColor,
        super(key: key);

  final double _bmiResult;
  final String _textResult;
  final Color _resColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      padding: EdgeInsets.all(15.0),
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 43.5,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 18.5,
                color: Colors.blue,
                startWidth: 15,
                endWidth: 15,
              ),
              GaugeRange(
                startValue: 18.51,
                endValue: 25,
                color: Colors.green,
                startWidth: 15,
                endWidth: 15,
              ),
              GaugeRange(
                startValue: 25.01,
                endValue: 50,
                color: Colors.red,
                startWidth: 15,
                endWidth: 15,
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
                    SizedBox(height: 150.0),
                    Container(
                      child: Text(
                        _bmiResult.toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 40.0),
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
    );
  }
}
