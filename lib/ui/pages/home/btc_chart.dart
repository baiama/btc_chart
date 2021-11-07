part of 'home.dart';

class _BtcChart extends StatelessWidget {
  final BTCModel btcModel;
  const _BtcChart({Key? key, required this.btcModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      height: 400,
      width: double.infinity,
      child: CustomPaint(
        painter: ChartPainter(
          btcModel: btcModel,
        ),
      ),
    );
  }
}
