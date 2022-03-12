import 'package:flutter/material.dart';
import 'dart:math' as math;

class Yellow extends StatelessWidget {
  const Yellow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: MyYellow(),
      ),
    );
  }
}

class MyYellow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    // Draw the body
    final paint = Paint()..color = const Color(0xFFFFD751);
    canvas.drawCircle(center, radius, paint);

    //draw brows
    final browPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    browPaint.color = const Color(0xFF408080);
    Path path = Path();
    path.moveTo(40, 60);
    path.quadraticBezierTo(80, 52, size.width / 2.6, 95);
    canvas.drawPath(path, browPaint);

    path.moveTo(38, 100);
    path.quadraticBezierTo(50, 70, size.width / 2.6, 95);
    canvas.drawPath(path, browPaint);

    path.moveTo(260, 60);
    path.quadraticBezierTo(220, 52, size.width / 1.6, 100);
    canvas.drawPath(path, browPaint);

    path.moveTo(262, 100);
    path.quadraticBezierTo(250, 70, size.width / 1.6, 100);
    canvas.drawPath(path, browPaint);

    //draw mouth
    final mouthPaint = Paint()
      ..color = const Color(0xFF408080)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    path.moveTo(size.width / 2.8, size.height / 1.9);
    path.lineTo(size.width / 1.5, size.height / 1.9);
    canvas.drawPath(path, mouthPaint);

    path.moveTo(size.width / 2.8, size.height / 1.9);
    path.quadraticBezierTo(150, 240, size.width / 1.5, size.height / 1.9);
    canvas.drawPath(path, mouthPaint);

    //draw cheeks
    final cheekPaint = Paint()
      ..color = const Color(0xFFF6BD00)
      ..strokeWidth = 10;

    final lcenter = Offset(60, size.height / 2);
    canvas.drawOval(
        Rect.fromCenter(center: lcenter, width: 65, height: 20), cheekPaint);

    final rcenter = Offset(240, size.height / 2);
    canvas.drawOval(
        Rect.fromCenter(center: rcenter, width: 65, height: 20), cheekPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
