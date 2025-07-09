import 'package:flutter/material.dart';
import 'package:gpa_calculator/view/helper.dart';

class ClassInfoResult extends StatelessWidget {
  const ClassInfoResult({
    super.key,
    required this.index,
    required this.grade,
    required this.credite,
    this.className = 'Class',
  });

  final int index;
  final String className;
  final String grade;
  final int credite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: context.screenWidth / 5,
          child: Center(
            child: Text(
              className == 'Class' ? 'Class $index:' : '$className:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.cyan,
              ),
            ),
          ),
        ),
        SizedBox(
          width: context.screenWidth / 5,
          child: Center(child: Text(grade, style: TextStyle(fontSize: 18))),
        ),
        SizedBox(
          width: context.screenWidth / 5,
          child:
              Center(child: Text('$credite', style: TextStyle(fontSize: 18))),
        ),
      ],
    );
  }
}
