import 'dart:ui';
import 'package:flutter/material.dart';

class DashedOvalPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedOvalPainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.dashWidth = 10.0,
    this.dashSpace = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    
    // Yüz çevresine oval çizmek yerine bir oval'in path'ini alıp kesik çizgili (dashed) yapıyoruz.
    Path ovalPath = Path()..addOval(rect);

    // Çizgiyi kesik hale getiren basit algoritma
    Path dashedPath = Path();
    for (PathMetric measurePath in ovalPath.computeMetrics()) {
      double distance = 0.0;
      while (distance < measurePath.length) {
        dashedPath.addPath(
          measurePath.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
