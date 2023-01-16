import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NameContainer extends StatelessWidget {
  const NameContainer({
    Key? key,
    required TextEditingController usernameController,
  })  : _usernameController = usernameController,
        super(key: key);

  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 53.0, vertical: 20.0),
      child: Material(
        child: Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              depth: -8,
              lightSource: LightSource.topLeft,
              color: Colors.white),
          child: TextField(
            controller: _usernameController,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
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
    );
  }
}
