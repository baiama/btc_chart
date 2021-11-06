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
  final String item;
  const HomePageStateLoaded({required this.item});
  @override
  List<Object?> get props => [item];
}
