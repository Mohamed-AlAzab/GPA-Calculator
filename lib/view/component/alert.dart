import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({
    super.key,
    required this.onPressed,
    required this.title,
    required this.content,
    required this.textButton,
  });

  final String title;
  final String content;
  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(textButton),
        )
      ],
    );
  }
}
