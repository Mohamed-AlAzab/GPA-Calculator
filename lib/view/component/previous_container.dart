import 'package:flutter/material.dart';
import 'package:gpa_calculator/view/helper.dart';

class PreviousContainer extends StatelessWidget {
  const PreviousContainer({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
  });

  final String text;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth / 2.5,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          TextField(
            controller: controller,
            style: TextStyle(height: 0),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
