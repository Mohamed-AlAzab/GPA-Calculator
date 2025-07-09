import 'package:flutter/material.dart';
import 'package:gpa_calculator/view/helper.dart';

class ClassInfoLable extends StatelessWidget {
  const ClassInfoLable({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth / 4,
      decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(color: Colors.grey),
          ),
          borderRadius: BorderRadius.circular(16)),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.amber.shade900),
      ),
    );
  }
}
