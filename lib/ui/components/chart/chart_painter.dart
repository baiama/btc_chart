import 'package:btc_chart/logic/models/btc_model.dart';
import 'package:btc_chart/presentation/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ChartPainter extends CustomPainter {
  final BTCModel btcModel;

  ChartPainter({required this.btcModel});

  @override
  void paint(Canvas canvas, Size size) {
    // Gradient paint  for path
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        [
          AppColors.chartPathColor,
          AppColors.white,
        ],
      );
    //Paint for stroke path
    final Paint strokePaint = Paint()
      ..color = AppColors.chartPathColor
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    //Path points
    final points = btcModel.points;
    //_path for drawing gradient area of chart
    final _path = Path();
    //strokePath for drawing curve path of chart
    final strokePath = Path();
    final startHeight = size.height;
    final yMin = btcModel.low;
    final yMax = btcModel.high;
    final yHeight = yMax - yMin;
    // distance between points
    final _step = size.width / points.length;
    //start point of x
    var _dx = 0.0;
    //Moving area path to start point
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
      if (_dx == 0) {
        strokePath.moveTo(_dx, yValue);
        _path.lineTo(_dx, yValue);
      } else {
        final previousValue = points[i - 1];
        final xPrevious = _dx - _step;
        final yPrevious = yHeight == 0
            ? startHeight
            : ((yMax - previousValue) / yHeight) * size.height;
        final controlPointX = xPrevious + (_dx - xPrevious) / 2;
        strokePath.cubicTo(
            controlPointX, yPrevious, controlPointX, yValue, _dx, yValue);
        _path.cubicTo(
            controlPointX, yPrevious, controlPointX, yValue, _dx, yValue);
      }
      _dx += _step;
    }
    //Moving area path to end point
    _path.lineTo(size.width, size.height);
    canvas.drawPath(strokePath, strokePaint);
    canvas.drawPath(_path, paint);
  }

  double getHeight(double availableHeight, double value, double high) {
    return availableHeight - (availableHeight * value) / high;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
