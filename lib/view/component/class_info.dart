import 'package:flutter/material.dart';
import 'package:gpa_calculator/view/helper.dart';

class ClassInfo extends StatelessWidget {
  const ClassInfo({
    super.key,
    required this.index,
    required this.creditsItems,
    required this.gradeItems,
    required this.selectedCridetsValue,
    required this.selectedGradeValue,
    required this.onGradeChange,
    required this.onCridetChange,
  });

  final int index;
  final String? selectedGradeValue;
  final int? selectedCridetsValue;
  final List<String> gradeItems;
  final List<int> creditsItems;
  final ValueChanged<String?>? onGradeChange;
  final ValueChanged<int?>? onCridetChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .85,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: context.screenWidth / 4,
            child: Center(
              child: Text(
                'Class $index:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.cyan,
                ),
              ),
            ),
          ),
          SizedBox(
            width: context.screenWidth / 5.5,
            // height: 50,
            child: DropdownButton(
              underline: SizedBox(),
              value: selectedGradeValue,
              alignment: Alignment.center,
              hint: Text('Grade'),
              items: gradeItems.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Center(child: Text(item)),
                );
              }).toList(),
              onChanged: onGradeChange,
            ),
          ),
          SizedBox(
            width: context.screenWidth / 5,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: selectedCridetsValue,
                alignment: Alignment.center,
                hint: Text('Credits'),
                items: creditsItems.map<DropdownMenuItem<int>>((int item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Center(child: Text("$item")),
                  );
                }).toList(),
                onChanged: onCridetChange,
              ),
            ),
          )
        ],
      ),
    );
  }
}
