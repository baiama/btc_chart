import 'package:btc_chart/logic/cubits/home_page_cubit.dart';
import 'package:btc_chart/logic/cubits/home_page_state.dart';
import 'package:btc_chart/logic/models/btc_model.dart';
import 'package:btc_chart/presentation/app_colors.dart';
import 'package:btc_chart/presentation/app_text_styles.dart';
import 'package:btc_chart/ui/components/loader/circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_header.dart';
part 'home_footer.dart';

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
          listener: (BuildContext context, state) {
            if (state is HomePageStateError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.error,
                  style: AppTextStyles.snackBar,
                ),
                backgroundColor: AppColors.white,
              ));
            }
          },
          builder: (BuildContext context, state) {
            if (state is HomePageStateLoading) {
              return const CircularLoader();
            }
            if (state is HomePageStateLoaded) {
              return _HomePageLoaded(btcModel: state.btcData);
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class _HomePageLoaded extends StatelessWidget {
  final BTCModel btcModel;
  const _HomePageLoaded({Key? key, required this.btcModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _HomePageHeader(
            btcModel: btcModel,
          ),
          const _HomePageFooter(),
        ],
      ),
    );
  }
}
