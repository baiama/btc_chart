import 'package:btc_chart/logic/api/btc_api.dart';
import 'package:btc_chart/logic/cubits/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageStateInitial());

  final _api = BTCApi();

  void loadData() async {
    emit(const HomePageStateLoading());
    var banners = await _api.getClient();
    emit(HomePageStateLoaded(item: ""));
  }
}
