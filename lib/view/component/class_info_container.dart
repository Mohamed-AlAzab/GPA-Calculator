import 'package:flutter/material.dart';
import 'package:gpa_calculator/view/component/class_info_lable.dart';

class ClassInfoContainer extends StatelessWidget {
  const ClassInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClassInfoLable(text: 'Class'),
        ClassInfoLable(text: 'Grade'),
        ClassInfoLable(text: 'Credits'),
      ],
    );
  }
}
