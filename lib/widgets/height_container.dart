import 'package:flutter/material.dart';

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
      height: 72,
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 20,
        shadowColor: Colors.grey[200],
        child: TextField(
          textAlign: TextAlign.center,
          controller: _heightController,
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w300,
            color: Colors.grey[600],
          ),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5)),
            hintText: "Height",
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontWeight: FontWeight.w300,
                fontSize: 42),
          ),
        ),
      ),
    );
  }
}
