import 'package:btc_chart/logic/models/btc_model.dart';
import 'package:btc_chart/presentation/app_colors.dart';
import 'package:flutter/material.dart';

class ChartPainter extends CustomPainter {
  final BTCModel btcModel;

  ChartPainter({required this.btcModel});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint pathPaint = Paint()
      ..color = AppColors.chartPathColor
      ..style = PaintingStyle.fill;
    final Paint strokePaint = Paint()
      ..color = AppColors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final points = btcModel.points;
    final path = Path();
    final startHeight = 0.5 * size.height;
    final yMin = btcModel.low;
    final yMax = btcModel.high;
    final yHeight = yMax - yMin;
    final xAxisStep = size.width / points.length;
    var xValue = 0.0;
    for (var i = 0; i < points.length; i++) {
      final value = points[i];
      final yValue =
          yHeight == 0 ? startHeight : ((yMax - value) / yHeight) * size.height;
      if (xValue == 0) {
        path.moveTo(xValue, yValue);
      } else {
        final previousValue = points[i - 1];
        final xPrevious = xValue - xAxisStep;
        final yPrevious = yHeight == 0
            ? startHeight
            : ((yMax - previousValue) / yHeight) * size.height;
        final controlPointX = xPrevious + (xValue - xPrevious) / 2;
        path.cubicTo(
            controlPointX, yPrevious, controlPointX, yValue, xValue, yValue);
      }
      xValue += xAxisStep;
    }
    canvas.drawPath(path, strokePaint);
  }

  double getHeight(double availableHeight, double value, double high) {
    return availableHeight - (availableHeight * value) / high;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
