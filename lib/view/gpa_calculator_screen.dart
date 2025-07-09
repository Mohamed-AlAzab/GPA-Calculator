import 'package:flutter/material.dart';
import 'package:gpa_calculator/view/CardClipper.dart';
import 'package:gpa_calculator/view/component/Alert.dart';
import 'package:gpa_calculator/view/component/add_class_button.dart';
import 'package:gpa_calculator/view/component/class_info.dart';
import 'package:gpa_calculator/model/class.dart';
import 'package:gpa_calculator/view/component/class_info_container.dart';
import 'package:gpa_calculator/view/component/my_button.dart';
import 'package:gpa_calculator/view/component/previous_info_container.dart';
import 'package:gpa_calculator/view/helper.dart';
import 'package:gpa_calculator/view/result_screen.dart';

class GPACalculatorScreen extends StatefulWidget {
  const GPACalculatorScreen({super.key});

  @override
  State<GPACalculatorScreen> createState() => _GPACalculatorScreenState();
}

class _GPACalculatorScreenState extends State<GPACalculatorScreen> {
  final Map<String, double> standardGrade = {
    'A': 4,
    '-A': 3.67,
    '+B': 3.33,
    'B': 3,
    '-B': 2.67,
    '+C': 2.33,
    'C': 2,
    '-C': 1.67,
    '+D': 1.33,
    'D': 1,
    'F': 0
  };
  final List<String> gradeItems = [
    'A',
    '-A',
    '+B',
    'B',
    '-B',
    '+C',
    'C',
    '-C',
    '+D',
    'D',
    'F'
  ];
  final List<int> creditsItems = [0, 1, 2, 3, 4];

  int previousCredits = 0;
  double previousGrade = 0;
  TextEditingController? previousCreditsController = TextEditingController();
  TextEditingController? previousGradeController = TextEditingController();

  List<Class> classInfoItems = [
    Class(grade: null, credite: null),
    Class(grade: null, credite: null),
    Class(grade: null, credite: null),
    Class(grade: null, credite: null)
  ];

  double semesterGPA = 0;
  bool isCalculateSemesterGPA = false;
  double semesterPoints = 0;

  int semesterCridets = 0;
  double cumulativeGPA = 0;
  bool isCalculateCumulativeGPA = false;

  void _clear() {
    setState(() {
      classInfoItems = [
        Class(grade: null, credite: null),
        Class(grade: null, credite: null),
        Class(grade: null, credite: null),
        Class(grade: null, credite: null)
      ];
      isCalculateCumulativeGPA = isCalculateSemesterGPA = false;
      previousCreditsController!.clear();
      previousGradeController!.clear();
    });
  }

  void _clearClassInfoItemsFromNull() {
    setState(() {
      classInfoItems.removeWhere((item) =>
          item.grade == null || item.credite == null || item.credite == 0);
    });
  }

  bool _isClassInfoItemsEmpty() {
    List<Class> tempList = classInfoItems;
    tempList.removeWhere((item) =>
        item.grade == null || item.credite == null || item.credite == 0);

    return tempList.isEmpty;
  }

  bool _isPreviousTextFieldEmpty() {
    return previousCreditsController!.text.isEmpty &&
        previousGradeController!.text.isEmpty;
  }

  bool _isPreviousTextFieldsHaveRealData() {
    if (previousCreditsController!.text.isEmpty ||
        previousGradeController!.text.isEmpty) {
      return false;
    }

    if (int.tryParse(previousCreditsController!.text) != null &&
        double.tryParse(previousGradeController!.text) != null) {
      return true;
    }
    return false;
  }

  void _calculateSemesterGPA() {
    semesterCridets = 0;
    semesterPoints = 0;
    if (classInfoItems.isNotEmpty) {
      for (int i = 0; i < classInfoItems.length; i++) {
        semesterPoints += standardGrade[classInfoItems[i].grade]! *
            classInfoItems[i].credite!;

        semesterCridets += classInfoItems[i].credite!;
      }
      semesterGPA = semesterPoints / semesterCridets;
      isCalculateSemesterGPA = true;
    }
  }

  void _calculateCumulativeGPA() {
    if (semesterCridets + previousCredits == 0) {
      cumulativeGPA = 0;
    } else {
      cumulativeGPA = (semesterPoints + previousGrade * previousCredits) /
          (semesterCridets + previousCredits);
    }
    isCalculateCumulativeGPA = true;
  }

  @override
  void dispose() {
    previousCreditsController?.dispose();
    previousGradeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFF18FFFF), const Color(0xFF00BCD4), Colors.blue],
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
                      SizedBox(width: 50),
                      Text(
                        'GPA Calculator',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _clear(),
                        icon: Icon(Icons.delete),
                        color: Colors.black,
                      )
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
                          child: Container(
                            alignment: Alignment.center,
                            width: context.screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                PreviousInfoContainer(
                                  previousCridetController:
                                      previousCreditsController,
                                  previousGradeController:
                                      previousGradeController,
                                ),
                                ClassInfoContainer(),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: classInfoItems.length,
                                      itemBuilder: (context, index) {
                                        return ClassInfo(
                                            index: index + 1,
                                            creditsItems: creditsItems,
                                            gradeItems: gradeItems,
                                            selectedCridetsValue:
                                                classInfoItems[index].credite,
                                            selectedGradeValue:
                                                classInfoItems[index].grade,
                                            onGradeChange: (grade) {
                                              setState(() {
                                                classInfoItems[index].grade =
                                                    grade!;
                                              });
                                            },
                                            onCridetChange: (cridete) {
                                              setState(() {
                                                classInfoItems[index].credite =
                                                    cridete!;
                                              });
                                            });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                AddClassButton(
                                  onTap: () => setState(() {
                                    classInfoItems
                                        .add(Class(grade: null, credite: null));
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 14,
                            top: 8,
                            bottom: 35,
                          ),
                          child: MyButton(
                            onTap: () => _calculation(),
                            text: 'Calculate',
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

  void _calculation() {
    if (!_isClassInfoItemsEmpty()) {
      if (_isPreviousTextFieldEmpty()) {
        previousCredits = 0;
        previousGrade = 0.0;
        _clearClassInfoItemsFromNull();
        _calculateSemesterGPA();
        _calculateCumulativeGPA();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              classInfoItems: classInfoItems,
              previousCridet: previousCredits,
              previousGrade: previousGrade,
              semesterGPA: semesterGPA,
              cumulativeGPA: cumulativeGPA,
            ),
          ),
        );
      } else if (_isPreviousTextFieldsHaveRealData()) {
        previousCredits = int.parse(previousCreditsController!.text);
        previousGrade = double.parse(previousGradeController!.text);
        if ((previousCredits <= 170 && previousCredits >= 0) &&
            (previousGrade <= 4 && previousGrade >= 0)) {
          _clearClassInfoItemsFromNull();
          _calculateSemesterGPA();
          _calculateCumulativeGPA();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                classInfoItems: classInfoItems,
                previousCridet: previousCredits,
                previousGrade: previousGrade,
                semesterGPA: semesterGPA,
                cumulativeGPA: cumulativeGPA,
              ),
            ),
          );
        } else {
          showAlretDialog(
            'Wrong Input',
            'Try to rewrite previous GPA and Credits',
            'Back',
            () => Navigator.pop(context),
          );
          return;
        }
      } else {
        showAlretDialog(
          'Wrong Input',
          'Try to rewrite previous GPA and Credits',
          'Back',
          () => Navigator.pop(context),
        );
        return;
      }
    } else {
      showAlretDialog(
        'Empty !',
        'Class is Empty',
        'Back',
        () => Navigator.pop(context),
      );
      return;
    }
  }
}
