import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/view/gpa_calculator_screen.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Initializes the Flutter engine and binding system.
  // Before you use any Flutter services, the internal Flutter engine must be fully initialized.

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp // Locks the app orientation to portrait only
  ]).then((_) {
    // Waits for the orientation setting to complete, then runs the Flutter app.
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPA Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: GPACalculatorScreen(),
    );
  }
}
