import 'package:btc_chart/logic/models/btc_model.dart';
import 'package:btc_chart/presentation/app_colors.dart';
import 'package:flutter/material.dart';

class ChartPainter extends CustomPainter {
  final BTCModel btcModel;

  ChartPainter({required this.btcModel});

  @override
  void paint(Canvas canvas, Size size) {
    final points = btcModel.points;
    final step = size.width / points.length;
    final _high = btcModel.high;
    final _low = btcModel.low;
    final availableHeight = size.height;
    Path path = Path();
    for (int i = 0; i < points.length; i++) {
      final dx = (i * step);
      if (i == 0) {
        final p1Height =
            getHeight(availableHeight, points[i] - _low, _high - _low);
        path.moveTo(dx, p1Height);
      }
      if (i < points.length - 1) {
        final p2Height =
            getHeight(availableHeight, points[i + 1] - _low, _high - _low);
        path.lineTo(dx + step, p2Height);
      }
    }
    // path.addRect(Rect.fromLTRB(0, 0, size.width, availableHeight));
    canvas.drawPath(path, pathPaint);
  }

  double getHeight(double availableHeight, double value, double high) {
    return availableHeight - (availableHeight * value) / high;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Paint get pathPaint {
    final Paint paint = Paint()
      ..color = AppColors.chartPathColor
      ..style = PaintingStyle.fill;
    return paint;
  }
}
