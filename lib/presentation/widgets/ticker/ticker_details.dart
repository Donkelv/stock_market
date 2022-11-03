



import 'package:stock_market/data/providers/historical_data.dart';
import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/widgets/initial_widget.dart';
import 'package:stock_market/presentation/widgets/loading_widget.dart';
import 'package:stock_market/presentation/widgets/offline_widget.dart';
import 'package:stock_market/presentation/widgets/ticker/ticker_data.dart';

import '../../../domain/entities/ticker.dart';
import '../custom_error_widget.dart';

class TickerDetails extends ConsumerWidget {
  const TickerDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historicalData = ref.watch(historicalDataStateProvider);
    Data? selectedTicker = ref.watch(selectedTickerProvider);
    return Expanded(
      child: historicalData.when(offline: () {
        return const OfflineWidget();
      }, initial: () {
        return const InitialWidget();
      }, loading: () {
        return const LoadingWidget();
      }, data: (data) {
        if (data.isEmpty) {
          return const CustomErrorWidget(error: "No Stock details available");
        } else {
          return TickerData(data: data, selectedTicker: selectedTicker);
        }
      }, error: (error) {
        return CustomErrorWidget(
          error: error,
        );
      }),
    );
  }
}
