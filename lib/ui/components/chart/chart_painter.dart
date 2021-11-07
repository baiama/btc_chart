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
    final Path path = Path();
    final Path strokePath = Path();
    final Path cubit = Path();

    for (int i = 0; i < points.length; i++) {
      final dx = (i * step);
      if (i == 0) {
        final p1Height =
            getHeight(availableHeight, points[i] - _low, _high - _low);
        path.moveTo(dx, p1Height);
        strokePath.moveTo(dx, p1Height);
        cubit.moveTo(dx, p1Height);
      }
      if (i < points.length - 1) {
        final p2Height =
            getHeight(availableHeight, points[i + 1] - _low, _high - _low);
        path.lineTo(dx + step, p2Height);
        strokePath.lineTo(dx + step, p2Height);
        cubit.cubicTo(dx + step / 4, p2Height + step, dx + step / 3,
            p2Height + step, dx + step, p2Height);
      }
    }
    // canvas.drawPath(path, pathPaint);
    canvas.drawPath(strokePath, strokePaint);
    canvas.drawPath(cubit, cubicPaint);
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

  Paint get strokePaint {
    final Paint paint = Paint()
      ..color = AppColors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    return paint;
  }

  Paint get cubicPaint {
    final Paint paint = Paint()
      ..color = AppColors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    return paint;
  }
}
