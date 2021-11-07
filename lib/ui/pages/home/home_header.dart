part of 'home.dart';

class _HomePageHeader extends StatelessWidget {
  final BTCModel btcModel;
  const _HomePageHeader({Key? key, required this.btcModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
            text: TextSpan(
              text: 'Bitcoin |',
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
          RichText(
            text: TextSpan(
              text: 'High: ',
              style: AppTextStyles.reg12,
              children: [
                TextSpan(
                    text: btcModel.high.toString(),
                    style: AppTextStyles.reg12.copyWith(
                      color: AppColors.grey,
                    )),
                const TextSpan(
                  text: "  Low: ",
                  style: AppTextStyles.reg12,
                ),
                TextSpan(
                    text: btcModel.low.toString(),
                    style: AppTextStyles.reg12.copyWith(
                      color: AppColors.grey,
                    )),
                const TextSpan(
                  text: "  Vol: ",
                  style: AppTextStyles.reg12,
                ),
                TextSpan(
                    text:
                        "${btcModel.volumePrimary24h}  \$${btcModel.volumeSecondary24h.truncateToDouble()}",
                    style: AppTextStyles.reg12.copyWith(
                      color: AppColors.grey,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
