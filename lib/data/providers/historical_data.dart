import 'package:stock_market/data/notifiers/historical_data.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/abstract/historical_data.dart';
import 'package:stock_market/domain/freezed/historical_data.dart';
import 'package:stock_market/domain/repositories/historical_data.dart';

final historicalDataStateProvider =
    StateNotifierProvider<HistoricalDataNotifier, HistoricalDataState>((ref) {
  return HistoricalDataNotifier(
      ref: ref,
      baseHistoricalDataRepository: ref.watch(historicalDataProvider));
});

final historicalDataProvider = Provider<BaseHistoricalDataRepository>((ref) {
  return HistoricalDataRepository();
});


final dateRangeProvider = StateProvider.autoDispose<String?>((ref) {
  return ;
});
