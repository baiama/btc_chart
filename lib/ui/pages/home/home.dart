import 'package:btc_chart/logic/cubits/home_page_cubit.dart';
import 'package:btc_chart/logic/cubits/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..loadData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('BTC/AUD'),
        ),
        body: BlocConsumer<HomePageCubit, HomePageState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}
