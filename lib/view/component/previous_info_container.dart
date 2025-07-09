import 'package:flutter/material.dart';
import 'package:gpa_calculator/view/component/previous_container.dart';

class PreviousInfoContainer extends StatelessWidget {
  const PreviousInfoContainer({
    super.key,
    required this.previousCridetController,
    required this.previousGradeController,
  });

  final TextEditingController? previousCridetController;
  final TextEditingController? previousGradeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PreviousContainer(
                  text: 'Previous Credits',
                  hintText: "00",
                  controller: previousCridetController,
                ),
                PreviousContainer(
                  text: 'Previous GPA',
                  hintText: '0.000',
                  controller: previousGradeController,
                ),
              ],
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
