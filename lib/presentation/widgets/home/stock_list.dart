



import 'package:stock_market/data/providers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/presentation/widgets/home/stock_widget.dart';
import '../custom_error_widget.dart';
import '../initial_widget.dart';
import '../loading_widget.dart';
import '../offline_widget.dart';

class StockList extends ConsumerStatefulWidget {
  const StockList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<StockList> createState() => _StockListState();
}

class _StockListState extends ConsumerState<StockList> {
  
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.watch(tickerStateProvider.notifier).ticker();
    });
    super.initState();
  }



  @override
  Widget build(
    BuildContext context,
  ) {
    final ticker = ref.watch(tickerStateProvider);

    return Expanded(
      child: ticker.when(
        offline: () {
          return const OfflineWidget();
        },
        initial: () {
          return const InitialWidget();
        },
        loading: () {
          return const LoadingWidget();
        },
        data: (data) {
          return const StockListWidget();
        },
        error: (error) {
          return CustomErrorWidget(
            error: error,
          );
        },
      ),
    );
  }
}
