part of 'home.dart';

class _HomePageHeader extends StatelessWidget {
  final BTCModel btcModel;
  const _HomePageHeader({Key? key, required this.btcModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
            text: TextSpan(
              text: 'Bitcoint |',
              style: AppTextStyles.reg16,
              children: [
                TextSpan(
                    text: ' BTC',
                    style: AppTextStyles.reg16.copyWith(
                      color: AppColors.grey,
                    )),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '\$${btcModel.price}',
                style: AppTextStyles.reg20,
              ),
              const SizedBox(width: 8),
              Text(
                "\$${btcModel.changeAmount} (${btcModel.changePercent}%)",
                style: AppTextStyles.reg14.copyWith(
                  color: AppColors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: _KeyValueText(
                      title: "High", value: btcModel.high.toString())),
              const SizedBox(width: 8),
              Flexible(
                  flex: 1,
                  child: _KeyValueText(
                      title: "Low", value: btcModel.low.toString())),
              const SizedBox(width: 8),
              Flexible(
                flex: 2,
                child: _KeyValueText(
                    title: "Vol",
                    value:
                        "${btcModel.volumePrimary24h}  \$${btcModel.volumeSecondary24h.truncateToDouble()}"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KeyValueText extends StatelessWidget {
  final String title;
  final String value;
  const _KeyValueText({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: AppTextStyles.reg12,
        ),
        Flexible(
          child: Text(
            "$value ",
            style: AppTextStyles.reg12.copyWith(
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
