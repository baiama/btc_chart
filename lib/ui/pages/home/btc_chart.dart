part of 'home.dart';

class _BtcChart extends StatelessWidget {
  final BTCModel btcModel;
  const _BtcChart({Key? key, required this.btcModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: CustomPaint(
        painter: ChartPainter(
          btcModel: btcModel,
        ),
      ),
    );
  }
}
