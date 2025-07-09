import 'package:flutter/material.dart';
import 'package:gpa_calculator/view/CardClipper.dart';
import 'package:gpa_calculator/model/class.dart';
import 'package:gpa_calculator/view/component/Alert.dart';
import 'package:gpa_calculator/view/component/class_info_container.dart';
import 'package:gpa_calculator/view/component/class_info_result.dart';
import 'package:gpa_calculator/view/component/my_button.dart';
import 'package:gpa_calculator/view/helper.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.classInfoItems,
    required this.previousCridet,
    required this.previousGrade,
    required this.semesterGPA,
    required this.cumulativeGPA,
  });

  final int previousCridet;
  final double previousGrade;
  final List<Class> classInfoItems;
  final double semesterGPA;
  final double cumulativeGPA;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyanAccent, Colors.cyan, Colors.blue],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  width: context.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      Text(
                        'GPA Calculator',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 50)
                    ],
                  ),
                ),
                ClipPath(
                  clipper: CardClipper(),
                  child: Container(
                    width: context.screenWidth,
                    height: context.screenHeight - 110,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: context.screenWidth,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.blue,
                                    width: 80,
                                    height: 80,
                                    alignment: Alignment.center,
                                    child: Text('Image'),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Previous Credits',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.cyan,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '${widget.previousCridet}',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Previous Grade',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.cyan,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '${widget.previousGrade}',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18),
                                  ClassInfoContainer(),
                                  SizedBox(height: 18),
                                  Flexible(
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: widget.classInfoItems.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          child: ClassInfoResult(
                                            index: index + 1,
                                            className: widget
                                                .classInfoItems[index].name,
                                            grade: widget
                                                .classInfoItems[index].grade!,
                                            credite: widget
                                                .classInfoItems[index].credite!,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Semester GPA: ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.amber.shade900,
                                        ),
                                      ),
                                      Text(
                                        widget.semesterGPA.toStringAsFixed(3),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cumulative GPA: ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.amber.shade900,
                                        ),
                                      ),
                                      Text(
                                        widget.cumulativeGPA.toStringAsFixed(3),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 35),
                          child: MyButton(
                            onTap: () {
                              showAlretDialog(
                                'Save is out of service',
                                'Sorry we still work on it',
                                'Back',
                                () => Navigator.pop(context),
                              );
                            },
                            text: 'Save',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlretDialog(
      String title, String content, String textButton, VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Alert(
          onPressed: onPressed,
          title: title,
          content: content,
          textButton: textButton,
        );
      },
    );
  }
}
