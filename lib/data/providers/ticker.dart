import 'package:stock_market/data/notifiers/ticker.dart';
import 'package:stock_market/data/utils/exports.dart';
import 'package:stock_market/domain/abstract/ticker.dart';
import 'package:stock_market/domain/entities/ticker.dart';
import 'package:stock_market/domain/freezed/ticker.dart';
import 'package:stock_market/domain/repositories/ticker.dart';

final tickerStateProvider =
    StateNotifierProvider<TickerNotifier, TickerState>((ref) {
  return TickerNotifier(
      ref: ref, baseTickerRepository: ref.watch(tickerProvider));
});

final tickerProvider = Provider<BaseTickerRepository>((ref) {
  return TickerRepository();
});




final tickerChangeNotifierProvider = ChangeNotifierProvider<TickerChangeNotifier>((ref) {
  return TickerChangeNotifier();
});



final selectedTickerProvider = StateProvider<Data?>((ref) {
  return ;
});
