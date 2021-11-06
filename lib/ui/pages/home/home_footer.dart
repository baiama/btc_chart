part of 'home.dart';

class _HomePageFooter extends StatelessWidget {
  const _HomePageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(AppColors.white),
                ),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.ten_k,
                  color: AppColors.orange,
                ),
                const SizedBox(width: 6),
                const Text(
                  'BTC Holdings',
                  style: AppTextStyles.reg16,
                ),
                const Spacer(),
                Text(
                  '0.6 | \$21.341',
                  style: AppTextStyles.reg14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Buy'))),
              const SizedBox(width: 12),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Sell'))),
            ],
          )
        ],
      ),
    );
  }
}
