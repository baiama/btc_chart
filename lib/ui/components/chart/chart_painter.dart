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
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final points = btcModel.points;
    final _path = Path();
    final strokePath = Path();
    final startHeight = size.height;
    final yMin = btcModel.low;
    final yMax = btcModel.high;
    final yHeight = yMax - yMin;
    final xAxisStep = size.width / points.length;
    var xValue = 0.0;
    _path.moveTo(0, size.height);
    for (var i = 0; i < points.length + 1; i++) {
      var value = 0.0;
      if (i == points.length) {
        value = points[i - 1];
      } else {
        value = points[i];
      }
      final yValue =
          yHeight == 0 ? startHeight : ((yMax - value) / yHeight) * size.height;
      if (xValue == 0) {
        strokePath.moveTo(xValue, yValue);
        _path.lineTo(xValue, yValue);
      } else {
        final previousValue = points[i - 1];
        final xPrevious = xValue - xAxisStep;
        final yPrevious = yHeight == 0
            ? startHeight
            : ((yMax - previousValue) / yHeight) * size.height;
        final controlPointX = xPrevious + (xValue - xPrevious) / 2;
        strokePath.cubicTo(
            controlPointX, yPrevious, controlPointX, yValue, xValue, yValue);
        _path.cubicTo(
            controlPointX, yPrevious, controlPointX, yValue, xValue, yValue);
      }
      xValue += xAxisStep;
    }

    _path.lineTo(size.width, size.height);
    canvas.drawPath(strokePath, strokePaint);
    canvas.drawPath(_path, pathPaint);
  }

  double getHeight(double availableHeight, double value, double high) {
    return availableHeight - (availableHeight * value) / high;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
