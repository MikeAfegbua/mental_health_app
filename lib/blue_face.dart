import 'package:flutter/material.dart';
import 'dart:math' as math;

class Blue extends StatelessWidget {
  const Blue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: MyBlue(),
      ),
    );
  }
}

class MyBlue extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    // Draw the body
    final paint = Paint()..color = Colors.blue.shade200;
    canvas.drawCircle(center, radius, paint);

    // Draw the mouth

    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    smilePaint.color = const Color(0xFF408080);

    Path path = Path();
    path.moveTo(size.width / 2.8, size.height / 1.9);
    path.lineTo(size.width / 1.5, size.height / 1.9);
    canvas.drawPath(path, smilePaint);
    // Draw the eyes
    final whiteEyesPaint = Paint()..color = Colors.white;
    final blackEyesPaint = Paint()..color = const Color(0xFF408080);
    canvas.drawCircle(Offset(center.dx - radius / 2, center.dy - radius / 2),
        35, whiteEyesPaint);

    canvas.drawCircle(Offset(center.dx + radius / 2, center.dy - radius / 2),
        35, whiteEyesPaint);

    canvas.drawCircle(
        Offset(center.dx - radius / 2.3, center.dy - radius / 2.7),
        15,
        blackEyesPaint);
    canvas.drawCircle(
        Offset(center.dx + radius / 2.3, center.dy - radius / 2.7),
        15,
        blackEyesPaint);

    //draw cheeks
    final cheekPaint = Paint()
      ..color = const Color(0xFF5F9AFF)
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
