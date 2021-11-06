class BTCModel {
  final double price;
  final double changePercent;
  final double changeAmount;
  final double high;
  final double low;
  final double volumePrimary24h;
  final double volumeSecondary24h;
  final List<double> points;
  final DateTime? pointsStartFrom;

  BTCModel({
    required this.price,
    required this.changePercent,
    required this.changeAmount,
    required this.high,
    required this.low,
    required this.volumePrimary24h,
    required this.volumeSecondary24h,
    required this.points,
    required this.pointsStartFrom,
  });

  factory BTCModel.fromJson(Map<String, dynamic> data) {
    List<double> _points = [];
    Iterable _pointsJson = data['points'];
    _points =
        _pointsJson.map((e) => double.tryParse(e.toString()) ?? 0).toList();
    return BTCModel(
      price: data['price'] ?? 0,
      changePercent: data['changePercent'] ?? 0,
      changeAmount: data['changeAmount'] ?? 0,
      high: data['high'] ?? 0,
      low: data['low'] ?? 0,
      volumePrimary24h: data['volumePrimary24h'] ?? 0,
      volumeSecondary24h: data['volumeSecondary24h'] ?? 0,
      points: _points,
      pointsStartFrom: DateTime.tryParse(data['pointsStartFrom']),
    );
  }
}
