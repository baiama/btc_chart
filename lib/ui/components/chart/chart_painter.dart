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
    final max = btcModel.high;
    Path path = Path();
    for (int i = 0; i < points.length - 1; i++) {
      var dx = (i * step);
      final p2Height = getHeight(size.height, points[i + 1], max);
      final p1Height = getHeight(size.height, points[i], max);
      print("ggwp $dx ${dx + step} ${points[i]} $p1Height $p2Height");
      path.moveTo(dx, p1Height);
      path.lineTo(dx + step, p2Height);
    }
    canvas.drawPath(path, pathPaint);
  }

  double getHeight(
      double availableHeight, double altitude, double maxAltitude) {
    return availableHeight - (availableHeight * altitude) / maxAltitude;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Paint get pathPaint {
    var paint = Paint()..color = AppColors.chartPathColor;
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.stroke;
    return paint;
  }
}
