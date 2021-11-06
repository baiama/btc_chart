import 'package:btc_chart/logic/models/btc_model.dart';
import 'package:btc_chart/presentation/app_colors.dart';
import 'package:flutter/material.dart';

class ChartPainter extends CustomPainter {
  final BTCModel btcModel;

  ChartPainter({required this.btcModel});

  @override
  void paint(Canvas canvas, Size size) {
    final filteredCoords = btcModel.points;
    final step = size.width / filteredCoords.length;
    final max = btcModel.high;
    for (int i = 0; i < filteredCoords.length - 1; i++) {
      var dx = (i * step);
      final p2Height = getHeight(size.height, filteredCoords[i + 1], max);
      final p2 = Offset(dx + step, p2Height);
      final p1Height = getHeight(size.height, filteredCoords[i], max);
      print("ggwp $dx ${dx + step} ${filteredCoords[i]} $p1Height $p2Height");
      Path path = Path();
      path.moveTo(dx, p1Height);
      path.arcToPoint(p2, radius: const Radius.circular(250));
      canvas.drawPath(path, pathPaint);
    }
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
