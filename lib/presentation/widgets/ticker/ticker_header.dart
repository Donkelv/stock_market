


import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/entities/ticker.dart';
import 'package:stock_market/presentation/utils/color_const.dart';
import 'package:stock_market/presentation/utils/theme.dart';

class TickerHeader extends ConsumerWidget {
  const TickerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Data? selectedTicker = ref.watch(selectedTickerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          selectedTicker!.symbol!,
          style: largeTextInter(),
        ),
        SizedBox(
          width: 10.0.w,
        ),
        Text(
          selectedTicker.name!,
          style: mediumTextInter().copyWith(color: ColorConst().gunMetalgray),
        ),
      ],
    );
  }
}
