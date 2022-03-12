import 'package:flutter/material.dart';
import 'dart:math' as math;

class Green extends StatelessWidget {
  const Green({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: MyGreen(),
      ),
    );
  }
}

class MyGreen extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // Draw the body
    final paint = Paint()..color = const Color(0xFF59F09F);
    canvas.drawCircle(center, radius, paint);

    // Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    smilePaint.color = const Color(0xFF408080);
    // canvas.draw(Rect.fromCircle(center: center, radius: 40), 3.15, 3, false,
    //     smilePaint);
    Path path = Path();
    path.moveTo(size.width / 2.8, size.height / 1.5);
    path.quadraticBezierTo(150, 90, 180, 199);
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

    //draw brows
    final browPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    browPaint.color = const Color(0xFF408080);
    path.moveTo(30, 70);
    path.quadraticBezierTo(70, 60, 70, 25);
    canvas.drawPath(path, browPaint);

    path.moveTo(270, 70);
    path.quadraticBezierTo(230, 60, 230, 25);
    canvas.drawPath(path, browPaint);

    //draw cheeks
    final cheekPaint = Paint()
      ..color = const Color(0xFF1BDB75)
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
