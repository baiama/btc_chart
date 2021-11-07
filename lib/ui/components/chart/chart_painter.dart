import 'package:btc_chart/logic/models/btc_model.dart';
import 'package:btc_chart/presentation/app_colors.dart';
import 'package:btc_chart/presentation/app_text_styles.dart';
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
    final yMin =
        points.reduce((value, element) => value < element ? value : element);
    final yMax =
        points.reduce((value, element) => value > element ? value : element);
    final yHeight = yMax - yMin;

    // distance between points
    final _step = size.width / points.length +
        (size.width / points.length) / points.length;
    //start point of x
    var x = 0.0;
    //Moving area path to start point
    _path.moveTo(0, size.height);
    for (var i = 0; i < points.length; i++) {
      final value = points[i];
      final y =
          yHeight == 0 ? startHeight : ((yMax - value) / yHeight) * size.height;
      if (value == yMax || value == yMin) {
        drawText(
          canvas,
          size,
          value.round().toString(),
          AppTextStyles.reg12,
          Offset(x, y),
          value == yMax,
        );
      }
      if (x == 0) {
        strokePath.moveTo(x, y);
        _path.lineTo(x, y);
      } else {
        final previousValue = points[i - 1];
        final xPrevious = x - _step;
        final yPrevious = yHeight == 0
            ? startHeight
            : ((yMax - previousValue) / yHeight) * size.height;
        //used for drawing curves if you want more
        //https://en.wikipedia.org/wiki/Bézier_curve
        final controlPointX = xPrevious + (x - xPrevious) / 2;
        strokePath.cubicTo(controlPointX, yPrevious, controlPointX, y, x, y);
        _path.cubicTo(controlPointX, yPrevious, controlPointX, y, x, y);
      }
      x += _step;
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

  void drawText(Canvas canvas, Size size, String text, TextStyle textStyle,
      Offset offset, bool max) {
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    var x = offset.dx;
    if ((x - textPainter.width / 2) < 0) {
      x = 0;
    } else if ((x + textPainter.width / 2) > size.width) {
      x = size.width - textPainter.width - 3;
    }
    var y = offset.dy;
    if (max) {
      y = y - 20;
    } else {
      y = y + 3;
    }
    Offset textOffset = Offset(x, y);
    textPainter.paint(canvas, textOffset);
  }
}
