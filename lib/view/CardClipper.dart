import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    double cornerRadius = 30.0;
    double sideRadius = 20.0;
    double midPoint = size.height * (3.8 / 5);

    // Start just below the top-left rounded corner
    path.moveTo(0, cornerRadius);

    // Left edge down
    path.lineTo(0, midPoint - sideRadius);

    // Bottom-left diagonal rounded corner (left side to bottom)
    path.quadraticBezierTo(0, midPoint, cornerRadius, midPoint + sideRadius);

    // Diagonal to bottom-right (slightly up to leave space for rounded corner)
    path.lineTo(size.width - cornerRadius, size.height);

    // Bottom-right rounded corner
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - cornerRadius);

    // Right edge up
    path.lineTo(size.width, cornerRadius);

    // Top-right corner
    path.quadraticBezierTo(size.width, 0, size.width - cornerRadius, 0);

    // Top edge to left
    path.lineTo(cornerRadius, 0);

    // Top-left corner
    path.quadraticBezierTo(0, 0, 0, cornerRadius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
