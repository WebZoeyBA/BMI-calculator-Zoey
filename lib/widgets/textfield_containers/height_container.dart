import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HeightContainer extends StatelessWidget {
  const HeightContainer({
    Key? key,
    required TextEditingController heightController,
  })  : _heightController = heightController,
        super(key: key);

  final TextEditingController _heightController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 70,
      child: Material(
        child: Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              depth: -8,
              lightSource: LightSource.topLeft,
              color: Colors.white),
          child: TextField(
            textAlign: TextAlign.center,
            controller: _heightController,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w300,
              color: Colors.grey[600],
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
    );
  }
}
