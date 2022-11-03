import 'package:stock_market/data/providers/historical_data.dart';
import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/pages/ticker_page.dart';
import 'package:stock_market/presentation/utils/theme.dart';

import '../../../domain/entities/ticker.dart';

class StockListWidget extends ConsumerWidget {
  const StockListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    List<Data> localData = ref.watch(tickerChangeNotifierProvider).localData;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: localData.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            width: size.width,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  ref
                      .watch(historicalDataStateProvider.notifier)
                      .historicalData(symbol: localData[index].symbol!);

                  ref.watch(selectedTickerProvider.notifier).state =
                      localData[index];

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TickerDetailsPage()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localData[index].symbol!,
                        style: semiLargeTextInter(),
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      Text(
                        localData[index].name!,
                        style: normalText(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
