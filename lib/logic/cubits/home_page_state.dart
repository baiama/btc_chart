import 'package:btc_chart/logic/models/btc_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageStateInitial extends HomePageState {
  const HomePageStateInitial();
  @override
  List<Object?> get props => [];
}

class HomePageStateLoading extends HomePageState {
  const HomePageStateLoading();
  @override
  List<Object?> get props => [];
}

class HomePageStateLoaded extends HomePageState {
  final BTCModel btcData;
  const HomePageStateLoaded({required this.btcData});
  @override
  List<Object?> get props => [btcData];
}
